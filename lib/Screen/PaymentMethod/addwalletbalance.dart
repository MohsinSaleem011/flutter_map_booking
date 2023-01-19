import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map_booking/Networking/Apis.dart';
import 'package:flutter_map_booking/Networking/getcontroller.dart';
import 'package:flutter_map_booking/Screen/PaymentMethod/addbalance/balance_model.dart';
import 'package:get/get.dart';
import '../../Networking/modeldriver.dart/otp.dart';
import 'package:http/http.dart' as http;

class Addwallet extends StatefulWidget {
  const Addwallet({Key? key}) : super(key: key);

  @override
  State<Addwallet> createState() => _AddwalletState();
}

class _AddwalletState extends State<Addwallet> {
  TextEditingController voucher = TextEditingController();
  String user_id = '';
  @override
  Widget build(BuildContext context) {
    Controller mycontroller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet Balance add through Api'),
      ),
      body: FutureBuilder<Userotplogin?>(
          future: Apis().postOtp(mycontroller.phncontroller.value.text),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // user_id=snapshot.data!.data!.id.toString();
              // mycontroller.name.value=snapshot.data!.data!.firstName.toString();
              // mycontroller.email.value=snapshot.data!.data!.email.toString();
              // mycontroller.username.value=snapshot.data!.data!.mobile.toString();
              // mycontroller.phonenumber.value=snapshot.data!.data!.firstName.toString();

              return Column(
                children: [
                  Center(
                      child:
                          Text(snapshot.data!.data!.walletBalance.toString())),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: voucher,
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                        getbalance(voucher.text);
                      },
                      child: Text("Press")),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Future<Providerid?> getbalance(String code) async {
    var url = Uri.parse(
        "https://giro.ly/api/user/verify_voucher?code=$code&user_id=85");
    try {
      var respo = await http.get(url);
      var balance = provideridFromJson(respo.body);
      print(respo.body);
      print("Mohsin you done very well");
      return balance;
    } catch (e) {
      print(e.toString());
    }
  }
}
