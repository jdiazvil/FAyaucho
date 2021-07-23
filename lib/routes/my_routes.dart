import 'package:get/get.dart';
import 'package:tinder_ayacucho/pages/food_page.dart';
import 'package:tinder_ayacucho/pages/home_page.dart';
import 'package:tinder_ayacucho/pages/login_page.dart';
import 'package:tinder_ayacucho/pages/register_login_page.dart';

routes() => [
      GetPage(name: "/home", page: () => HomePage()),
      GetPage(name: "/registration", page: () => RegisterLoginPage()),
      GetPage(name: "/loginpage", page: () => LoginPage()),
      GetPage(
          name: "/foodpage",
          page: () => FoodPage(),
          transition: Transition.zoom),
    ];
