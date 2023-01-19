import 'package:flutter/material.dart';
import 'package:flutter_map_booking/Networking/getcontroller.dart';
import 'package:flutter_map_booking/Screen/MyProfile/profile.dart';
import 'package:flutter_map_booking/app_router.dart';
import 'package:flutter_map_booking/theme/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../Networking/Apis.dart';
import '../../Networking/modeldriver.dart/otp.dart';

class MenuItems {
  String? name;
  IconData? icon;
  MenuItems({this.icon, this.name});
}

class MenuScreens extends StatelessWidget {
  final String? activeScreenName;

  MenuScreens({this.activeScreenName});

  @override
  Widget build(BuildContext context) {
    Controller homesctrl = Get.put(Controller());
    return Drawer(
      child: Column(
        children: <Widget>[
          FutureBuilder<Userotplogin?>(
              future: Apis().postOtp(homesctrl.phncontroller.value.text),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // user_id=snapshot.data!.data!.id.toString();
                  homesctrl.name.value =
                      snapshot.data!.data!.firstName.toString();
                  homesctrl.email.value = snapshot.data!.data!.email.toString();
                  homesctrl.username.value =
                      snapshot.data!.data!.mobile.toString();
                  homesctrl.phonenumber.value =
                      snapshot.data!.data!.firstName.toString();
                  homesctrl.dob.value = snapshot.data!.data!.dob.toString();
                  homesctrl.picture.value =
                      snapshot.data!.data!.picture.toString();

                  return Column(
                    children: [
                      // Center(child: Text(snapshot.data!.data!.walletBalance.toString())),
                    ],
                  );
                }
                return Container();
              }),
          UserAccountsDrawerHeader(
            margin: EdgeInsets.all(0.0),
            accountName: Text(
              homesctrl.name.value.toString(),
              style: headingWhite,
            ),
            accountEmail: Text("100 point - Gold member"),
            currentAccountPicture: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                    "http://giro.ly/public/provider/profile/${homesctrl.picture.toString()}")),
            onDetailsPressed: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute<Null>(
                  builder: (BuildContext context) {
                    return ProfileScreen();
                  },
                  fullscreenDialog: true));
            },
          ),
          MediaQuery.removePadding(
            context: context,
            // DrawerHeader consumes top MediaQuery padding.
            removeTop: true,
            child: Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowGlow();
                return false;
              },
              child: ListView(
                //padding: const EdgeInsets.only(top: 8.0),
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      // The initial contents of the drawer.
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.homeScreen,
                                  (Route<dynamic> route) => false);
                            },
                            child: Container(
                              height: 60.0,
                              color:
                                  this.activeScreenName!.compareTo("HOME") == 0
                                      ? greyColor2
                                      : whiteColor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      FontAwesomeIcons.home,
                                      color: blackColor,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Home',
                                      style: headingBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.homeScreen2,
                                  (Route<dynamic> route) => false);
                            },
                            child: Container(
                              height: 60.0,
                              color:
                                  this.activeScreenName!.compareTo("HOME2") == 0
                                      ? greyColor2
                                      : whiteColor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      FontAwesomeIcons.home,
                                      color: blackColor,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Home 2',
                                      style: headingBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context)
                                  .pushNamed(AppRoute.paymentMethodScreen);
                            },
                            child: Container(
                              height: 60.0,
                              color:
                                  this.activeScreenName!.compareTo("PAYMENT") ==
                                          0
                                      ? greyColor2
                                      : whiteColor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      FontAwesomeIcons.wallet,
                                      color: blackColor,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Payment',
                                      style: headingBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context)
                                  .pushNamed(AppRoute.historyScreen);
                            },
                            child: Container(
                              height: 60.0,
                              color:
                                  this.activeScreenName!.compareTo("HISTORY") ==
                                          0
                                      ? greyColor2
                                      : whiteColor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      FontAwesomeIcons.history,
                                      color: blackColor,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'History',
                                      style: headingBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              // Navigator.of(context).pushNamed(AppRoute.notificationScreen);
                              Navigator.of(context)
                                  .pushNamed(AppRoute.apinotification);
                            },
                            child: Container(
                              height: 60.0,
                              color: this
                                          .activeScreenName!
                                          .compareTo("NOTIFICATIONS") ==
                                      0
                                  ? greyColor2
                                  : whiteColor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      FontAwesomeIcons.bell,
                                      color: blackColor,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Notifications',
                                      style: headingBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context)
                                  .pushNamed(AppRoute.termsConditionsScreen);
                            },
                            child: Container(
                              height: 60.0,
                              color:
                                  this.activeScreenName!.compareTo("TERMS") == 0
                                      ? greyColor2
                                      : whiteColor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      FontAwesomeIcons.cogs,
                                      color: blackColor,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Terms & Conditions',
                                      style: headingBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pop(context);
                              Navigator.of(context)
                                  .pushNamed(AppRoute.chatScreen);
                              // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ChatScreen()));
                            },
                            child: Container(
                              height: 60.0,
                              color: whiteColor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      FontAwesomeIcons.chartArea,
                                      color: blackColor,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text('Chat Screen',
                                        style: headingBlack),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context)
                                  .pushReplacementNamed(AppRoute.loginScreen);
                              // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>LoginScreen()));
                            },
                            child: Container(
                              height: 60.0,
                              color: whiteColor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      FontAwesomeIcons.signOutAlt,
                                      color: blackColor,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Logout',
                                      style: headingBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // The drawer's "details" view.
                    ],
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
