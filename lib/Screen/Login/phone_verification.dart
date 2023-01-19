import 'dart:convert';
import 'package:flutter_map_booking/Networking/Apis.dart';
import 'package:flutter_map_booking/Networking/getcontroller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:flutter_map_booking/Components/ink_well_custom.dart';
import 'package:flutter_map_booking/Networking/modeldriver.dart/otp.dart';
import 'package:flutter_map_booking/Screen/Login/login.dart';
import 'package:flutter_map_booking/app_router.dart';
import 'package:flutter_map_booking/theme/style.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class PhoneVerification extends StatefulWidget {
  String? mobile;
  PhoneVerification({ this.mobile});
  
  @override
  
  _PhoneVerificationState createState() => _PhoneVerificationState();
  
}

class _PhoneVerificationState extends State<PhoneVerification> {
  TextEditingController controller = TextEditingController();
  Controller contr= Get.find<Controller>();

  String thisText = "";
  int pinLength = 4;

  bool hasError = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: blackColor,),
          onPressed: () => WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => LoginScreen())
                      );
  })

      ),
      ),
      body: SingleChildScrollView(
          child: InkWellCustom(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0.0, 20, 0.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
                      child: Text('Phone Verification',style: heading35Black,),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 0.0),
                      child: Text('Enter your OTP code hear'),
                    ),
                    SizedBox(height: 20,),
                         FutureBuilder<Userotplogin?>(
                                              future: 
                                                  // Apis().postOtp(widget.mobile.toString()),
                                                  Apis().postOtp(contr.phncontroller.value.text),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return CircularProgressIndicator();
                                                } else if (snapshot
                                                        .connectionState ==
                                                    ConnectionState.done) {
                                                  if (snapshot.hasError) {
                                                    return  Center(
                                                      child: Text(
                                                          'Invalid Mobile Number'),
                                                    );
                                                  } else if (snapshot.hasData) {
                                                    return Text("${snapshot.data!.data!.otp}",style: TextStyle(
                                                      fontSize: 40,
                                                      color: Colors.brown
                                                    ),);
                                                  } else {
                                                    return  Center(
                                                      child: Text(
                                                          'InValid Mobile Number'),
                                                    );
                                                  }
                                                } else {
                                                  return Text(
                                                      "Invalid Mobile Number");
                                                }
                                              }),
                    
                    Center(
                      child: PinCodeTextField(
                        autofocus: true,
                        controller: controller,
                        hideCharacter: false,
                        highlight: true,
                        highlightColor: secondary,
                        defaultBorderColor: blackColor,
                        hasTextBorderColor: primaryColor,
                        maxLength: pinLength,
                        hasError: hasError,
                        maskCharacter: "*",
                        onTextChanged: (text) {
                          setState(() {
                            hasError = false;
                          });
                        },
                        onDone: (text){
                          print("DONE $text");
                        },
                        wrapAlignment: WrapAlignment.start,
                        pinBoxDecoration: ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                        pinTextStyle: heading35Black,
                        pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
                        pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
                      ),
                    ),
                    SizedBox(height: 20),
                    ButtonTheme(
                      height: 50.0,
                      minWidth: MediaQuery.of(context).size.width-50,
                      child: MaterialButton(
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                        elevation: 0.0,
                        color: primaryColor,
                        // icon: new Text(''),
                        child: new Text('VERIFY NOW', style: headingWhite,),
                        onPressed: (){
                          Navigator.of(context).pushReplacementNamed(AppRoute.introScreen);
                        },
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new InkWell(
                              onTap: () => Navigator.of(context).pushNamed(AppRoute.loginScreen),
                              child: new Text("I didn't get a code",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  decoration: TextDecoration.underline
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                  ]
              ),
            ),
          )
      ),
    );
  }
}
