import 'package:flutter/material.dart';
import 'package:learn_flutter/screens/customer/homePage/home_page.dart';
import 'package:learn_flutter/screens/customer/settingsPage/settings_page.dart';
import 'package:learn_flutter/screens/customer/profilePage/profile_page.dart';

class CustomerRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
