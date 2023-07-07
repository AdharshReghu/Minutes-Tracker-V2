import 'package:flutter/material.dart';
import 'views/starting.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/authservices.dart';
import 'routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MinutesTracker());
}

class MinutesTracker extends StatelessWidget {
  const MinutesTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthService().HandleAuthState(),
    );
  }
}