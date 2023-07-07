import 'views/home.dart';
import 'package:get/get.dart';


class AppRoutes {
  static const String home = '/';
  // Add other route names for your app's screens
  static final routes = [
    GetPage(
      name: home,
      page: () => Home(),
    ),
  ];
}