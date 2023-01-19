import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map_booking/Screen/Notification/Apis/model.dart';
import 'package:flutter_map_booking/theme/style.dart';
import 'package:http/http.dart' as http;

class ApiNotification extends StatefulWidget {
  const ApiNotification({Key? key}) : super(key: key);

  @override
  State<ApiNotification> createState() => _ApiNotificationState();
}

class _ApiNotificationState extends State<ApiNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text("Notifications",style: TextStyle(color: Colors.black),),
      ),
      body: FutureBuilder<List<Usernotifications>?>(
        future: getnotification(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            // var notify = snapshot.data;
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 7,
                            color: Colors.grey.withOpacity(0.5),
                          )
                        ]
                      ),
                      child: ListTile(
                          tileColor: Colors.white,
                          title:
                              Text(snapshot.data![index].notifyType.toString()),
                          subtitle: Text(
                              snapshot.data![index].description.toString()),
                          leading: CircleAvatar(
                            backgroundColor: primaryColor,
                            child: Text(
                              snapshot.data![index].id.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(snapshot.data![index].expiryDate.toString()),
                              SizedBox(height: 10),
                              Text(snapshot.data![index].status.toString()),
                            ],
                          )),
                    ),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }

  Future<List<Usernotifications>?> getnotification() async {
    var url = Uri.parse("http://giro.ly/api/user/notifications/user");
    try {
      var res = await http.get(url);
      var data = usernotificationsFromJson(res.body);
      print(data);
      return data;
    } catch (e) {
      print(e.toString());
    }
  }
}
