import 'package:flutter/material.dart';
import 'views/starting.dart';
import 'package:get/get.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/authservices.dart';
import 'routes.dart';
import 'constants/constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MinutesTracker());
}

class MinutesTracker extends StatelessWidget {
  const MinutesTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      title: 'Meet Master',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EasySplashScreen(
        logoWidth: 80,
        title: Text("Meet Master",style: TextStyle(color: kMaintheme,fontSize: 30),),
        logo: Image.asset('./assets/icon.png'), // Replace with your own logo image path
        navigator: AuthService().HandleAuthState(),
        durationInSeconds: 5, // Set the duration of the splash screen
        backgroundColor: Colors.white, // Set the background color of the splash screen
      ),
    );
  }
}
