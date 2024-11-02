// lib/routes/guest_routes.dart
import 'package:flutter/material.dart';
import '../pages/home/home_page.dart';
import '../pages/signIn/sign_in.dart';
import '../pages/forgotPassword/forgot_password.dart';
import '../common/splash/splash_screen.dart';
import '../pages/signup/sign_up.dart';

class GuestRoutes {
  static const String splash = '/splash';
  static const String root = '/';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings/account';
  static const String signup = '/sign-up';

  static Map<String, Widget Function(BuildContext)> routes = {
    splash: (context) => const SplashScreen(),
    root: (context) => const SignInPage(),
    home: (context) => const MyHomePage(title: 'Di Codingin'),
    signup: (context) => const SignUpPage(),
    forgotPassword: (context) => const ForgotPasswordPage(),
  };

  static void navigateToSignIn(BuildContext context) {
    Navigator.pushNamed(context, root);
  }

  static void navigateToForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, forgotPassword);
  }

  static void navigateToRegister(BuildContext context) {
    Navigator.pushNamed(context, signup);
  }

  static void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      home,
      (route) => false,
    );
  }
}
