// lib/routes/guest_routes.dart
import 'package:flutter/material.dart';
import '../pages/home/home_page.dart';
import '../pages/signIn/sign_in.dart';
import '../pages/forgotPassword/forgot_password.dart';

class AppRoutes {
  static const String root = '/';
  static const String signIn = '/signin';
  static const String forgotPassword = '/forgot-password';
  static const String profile = '/profile';
  static const String settings = '/settings/account';

  static Map<String, Widget Function(BuildContext)> routes = {
    root: (context) => const MyHomePage(title: 'Di Codingin'),
    signIn: (context) => const SignInPage(),
    forgotPassword: (context) => const ForgotPasswordPage(),
  };

  static void navigateToSignIn(BuildContext context) {
    Navigator.pushNamed(context, signIn);
  }

  static void navigateToForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, forgotPassword);
  }

  static void navigateToRoot(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      root,
      (route) => false,
    );
  }
}
