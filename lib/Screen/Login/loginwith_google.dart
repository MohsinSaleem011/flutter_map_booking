// import 'dart:html';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignProvider extends ChangeNotifier{
//   final googleSignIn =GoogleSignIn();
//   GoogleSignInAccount?_user;
//   GoogleSignInAccount get user=>_user!;
//   Future googleLogin()async{
//     final googleUser= await googleSignIn.signIn(); 
//     if(googleUser==null)return ;
//     _user=googleUser;

//     final googleAuth = await googleUser.authentication;
//     final credential=GoogleAuthProvider.getCredential(
//       idToken: googleAuth.idToken, 
//       accessToken: googleAuth.accessToken
//       );
//       await FirebaseAuth.instance.signInWithCredential(credential );
//       notifyListeners();
//   }


// }

// function to implement the google signin

// creating firebase instance
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_map_booking/Screen/Home/home_screen.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// final FirebaseAuth auth = FirebaseAuth.instance;

// Future<void> signup(BuildContext context) async {
// 	final GoogleSignIn googleSignIn = GoogleSignIn();
// 	final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
// 	if (googleSignInAccount != null) {
// 	final GoogleSignInAuthentication googleSignInAuthentication =
// 		await googleSignInAccount.authentication;
// 	final AuthCredential authCredential = GoogleAuthProvider.getCredential(
// 		idToken: googleSignInAuthentication.idToken,
// 		accessToken: googleSignInAuthentication.accessToken);
	
// 	// Getting users credential
// 	UserCredential result = await auth.signInWithCredential(authCredential);
// 	User user = result.user;
	
// 	if (result != null) {
// 		Navigator.pushReplacement(
// 			context, MaterialPageRoute(builder: (context) => HomeScreens()));
// 	} // if result not null we simply call the MaterialpageRoute,
// 		// for go to the HomePage screen
// 	}
// }