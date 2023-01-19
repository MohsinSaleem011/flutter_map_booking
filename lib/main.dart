import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Blocs/place_bloc.dart';
import 'app_router.dart';
import 'package:flutter/material.dart';
import 'Screen/SplashScreen/splash_screen.dart';
import 'theme/style.dart';
import 'package:get/get.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlaceBloc>(
      create: (context) => PlaceBloc(),
      child: GetMaterialApp(
        title: 'Taxi App',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute.generateRoute,
        home: SplashScreen(),
      ),
    );
  }
}
