import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_map_booking/Networking/getcontroller.dart';
import 'package:flutter_map_booking/Networking/modeldriver.dart/otp.dart';
import 'package:flutter_map_booking/Screen/Login/phone_verification.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_booking/Components/ink_well_custom.dart';
import 'package:flutter_map_booking/Networking/Apis.dart';
import 'package:flutter_map_booking/app_router.dart';
import 'package:flutter_map_booking/theme/style.dart';
import 'package:flutter_map_booking/Components/validations.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String Button = 'no';
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController phonecontroller = TextEditingController();
  bool autovalidate = false;
  Validations? validations = new Validations();

  submit() {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      autovalidate = true; // Start validating on every change.
    } else {
      form.save();
      //code
      //   Navigator.push(context, MaterialPageRoute(builder: (_){
      //     return PhoneVerification(mobile: phonecontroller.text,);
      //   }));
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return PhoneVerification();
      }));
    }
  }
  //  navigt() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (_) => PhoneVerification()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Controller mycontroller = Get.put(Controller());
    return Scaffold(
      body: SingleChildScrollView(
        child: InkWellCustom(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Stack(children: <Widget>[
              Container(
                height: 250.0,
                width: double.infinity,
                color: Color(0xFFFDD148),
              ),
              Positioned(
                bottom: 450.0,
                right: 100.0,
                child: Container(
                  height: 400.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.0),
                    color: Color(0xFFFEE16D),
                  ),
                ),
              ),
              Positioned(
                bottom: 500.0,
                left: 150.0,
                child: Container(
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150.0),
                        color: Color(0xFFFEE16D).withOpacity(0.5))),
              ),
              new Padding(
                  padding: EdgeInsets.fromLTRB(32.0, 150.0, 32.0, 0.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: new Column(
                        children: <Widget>[
                          new Container(
                              //padding: EdgeInsets.only(top: 100.0),
                              child: new Material(
                            borderRadius: BorderRadius.circular(7.0),
                            elevation: 5.0,
                            child: new Container(
                              width: MediaQuery.of(context).size.width - 20.0,
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: new Form(
                                  key: formKey,
                                  child: new Container(
                                    padding: EdgeInsets.all(32.0),
                                    child: new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Login',
                                          style: heading35Black,
                                        ),
                                        new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            TextFormField(
                                                controller: mycontroller
                                                    .phncontroller.value,
                                                keyboardType:
                                                    TextInputType.phone,
                                                validator: validations!.validateMobile,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    prefixIcon: Icon(
                                                        Icons.phone,
                                                        color: Color(
                                                            getColorHexFromStr(
                                                                '#FEDF62')),
                                                        size: 20.0),
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 15.0,
                                                            top: 15.0),
                                                    hintText: 'Phone',
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontFamily:
                                                            'Quicksand'))),
                                          ],
                                        ),
                                        //     FutureBuilder<Userotplogin?>(
                                        // future:
                                        //     Apis().postOtp(mycontroller.phncontroller.value.text),
                                        // builder: (context, snapshot) {
                                        //   if (snapshot.connectionState ==
                                        //       ConnectionState.waiting) {
                                        //     return CircularProgressIndicator();
                                        //   } else if (snapshot
                                        //           .connectionState ==
                                        //       ConnectionState.done) {
                                        //     if (snapshot.hasError) {
                                        //       return const Text(
                                        //           'Invalid Mobile Number');
                                        //     } else if (snapshot.hasData) {
                                        //       return navigt();
                                        //     } else {
                                        //       return  Center(
                                        //         child: Text(
                                        //             'InValid Mobile Number'),
                                        //       );
                                        //     }
                                        //   } else {
                                        //     return Text(
                                        //         "Invalid Mobile Number");
                                        //   }
                                        // }),
                                        FutureBuilder<Userotplogin?>(
                                          future: postOtp(mycontroller
                                              .phncontroller.value.text),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Column(
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  SizedBox(
                                                    height: 40,
                                                  ),
                                                  Text(
                                                    "Number is valid",
                                                    style: TextStyle(
                                                      wordSpacing: 5,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Column(
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  SizedBox(
                                                    height: 40,
                                                  ),
                                                  Text(
                                                    "Invalid Number",
                                                    style: TextStyle(
                                                      wordSpacing: 5,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }
                                          },
                                        ),

                                        (Button == 'Done OTP')
                                            ? new ButtonTheme(
                                                height: 50.0,
                                                minWidth: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: MaterialButton(
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    15.0)),
                                                    elevation: 0.0,
                                                    color: primaryColor,
                                                    // icon: new Text(''),
                                                    child: new Text(
                                                      'NEXT',
                                                      style: headingWhite,
                                                    ),
                                                    onPressed: () {
                                                      // Apis().postOtp(phonecontroller.text);
                                                      submit();
                                                      //                                                      Navigator.push(context, MaterialPageRoute(builder: (_){
                                                      //     return PhoneVerification(mobile: mycontroller.phncontroller.value.text,);
                                                      //   }));
                                                    }),
                                              )
                                            : Text(""),
                                      ],
                                    ),
                                  )),
                            ),
                          )),

                          new Container(
                              padding:
                                  EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Text(
                                    "Create new account? ",
                                    style: textGrey,
                                  ),
                                  new InkWell(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed(AppRoute.signUpScreen),
                                    child: new Text(
                                      "Sign Up",
                                      style: textStyleActive,
                                    ),
                                  ),
                                ],
                              )),

                          // SizedBox(height: 30,),
                          // MaterialButton(
                          //   color: primaryColor,
                          //   onPressed: (){},child: Text("Sign in with google",style:  headingWhite,),)
                        ],
                      ))),
            ])
          ]),
        ),
      ),
    );
  }

  Future<Userotplogin?> postOtp(String mobile_no) async {
    String baseUrl = "https://giro.ly/api/user/test_login";
    final res = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          'type': "user",
          'mobile': mobile_no,
        },
      ),
    );
    print(res.body.toString());
    if (res.statusCode == 200) {
      setState(() {
        Button = 'Done OTP';
      });

      return Userotplogin.fromJson(jsonDecode(res.body));
    }
    if (res.statusCode != 200) {
      setState(() {
        Button = 'no';
      });
    } else
      (e) {
        throw (e.toString());
      };
  }
}
