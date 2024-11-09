import 'package:flutter/material.dart';
import 'package:learn_flutter/screens/guest/auth/forgotPassword/forgot_password_page.dart';
import 'package:learn_flutter/screens/guest/auth/login/login_page.dart';
import 'package:learn_flutter/screens/guest/auth/register/register_page.dart';

class GuestRoute {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginPage(),
        );
      case '/forgot-password':
        return MaterialPageRoute(
          builder: (BuildContext context) => const ForgotPasswordPage(),
        );
      case '/register':
        return MaterialPageRoute(
          builder: (BuildContext context) => const RegisterPage(),
        );
      default:
        return null;
    }
  }
}
