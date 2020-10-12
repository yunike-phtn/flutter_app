import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/cart/cartPage.dart';
import 'package:flutter_app/screens/account/accountPage.dart';
import 'package:flutter_app/screens/home/homePage.dart';
import 'package:flutter_app/screens/login/loginPage.dart';
import 'package:flutter_app/screens/profile/profilePage.dart';

class Routes {
  Routes._();

  /// static variables
  static const String home = '/home';
  static const String account = '/account';
  static const String login = '/login';
  static const String profile = '/profile';
  static const String cart = '/cart';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => HomePage(),
    account: (BuildContext context) => AccountPage(),
    login: (BuildContext context) => LoginPage(),
    profile: (BuildContext context) => ProfilePage(),
    cart: (BuildContext context) => CartPage(),
  };
}
