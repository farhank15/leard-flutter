// routes/customer_route.dart
import 'package:flutter/material.dart';
import 'package:learn_flutter/screens/customer/homePage/home_page.dart';

class CustomerRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
