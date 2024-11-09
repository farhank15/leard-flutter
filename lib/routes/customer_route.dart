// routes/customer_route.dart
import 'package:flutter/material.dart';
import '../screens/customer/customer_page.dart';

class CustomerRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/customer':
        return MaterialPageRoute(builder: (_) => const CustomerPage());
      default:
        return MaterialPageRoute(builder: (_) => const CustomerPage());
    }
  }
}
