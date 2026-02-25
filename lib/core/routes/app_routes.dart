import 'package:flutter_sliver_commerce/modules/auth/login_screen.dart';
import 'package:flutter_sliver_commerce/modules/home/home_screen.dart';
import 'package:flutter_sliver_commerce/modules/profile/profile_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const login = "/login";
  static const home = "/home";
  static const profile = "/profile";
}

class AppRoutes {
  static final routes = [
    GetPage(name: Routes.login, page: () => LoginScreen()),
    GetPage(name: Routes.home, page: () => HomeScreen()),
    GetPage(name: Routes.profile, page: () => ProfileScreen()),
  ];
}