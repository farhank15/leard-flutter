import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/providers/auth_provider.dart';
import 'guest_route.dart';
import 'customer_route.dart';

class AppRouter {
  static Route<dynamic> generateRoute(
      BuildContext context, RouteSettings settings) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (authProvider.isAuthenticated) {
      // Jika pengguna sudah login, arahkan ke CustomerRoute
      switch (authProvider.currentUser?.role) {
        case 'customer':
          return CustomerRoute.generateRoute(settings);
        default:
          return GuestRoute.generateRoute(settings) ?? _errorRoute();
      }
    } else {
      // Jika pengguna belum login, arahkan ke halaman login
      if (settings.name == '/') {
        return GuestRoute.generateRoute(const RouteSettings(name: '/login')) ??
            _errorRoute();
      }
      return GuestRoute.generateRoute(settings) ?? _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(
          child: Text('Route tidak ditemukan!'),
        ),
      ),
    );
  }
}
