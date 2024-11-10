import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/providers/auth_provider.dart';
import 'package:learn_flutter/screens/customer/customer_scree.dart';
import 'guest_route.dart';

class AppRouter {
  static Route<dynamic> generateRoute(
      BuildContext context, RouteSettings settings) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (authProvider.isAuthenticated) {
      // Use CustomerScreen as the main container for authenticated pages
      return MaterialPageRoute(builder: (_) => CustomerScreen());
    } else {
      // For unauthenticated users, use GuestRoute for authentication pages
      if (settings.name == '/login' ||
          settings.name == '/register' ||
          settings.name == '/forgot-password') {
        return GuestRoute.generateRoute(settings) ?? _errorRoute();
      } else {
        // Redirect any unauthenticated attempt to login
        return GuestRoute.generateRoute(const RouteSettings(name: '/login')) ??
            _errorRoute();
      }
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(
          child: Text('Route not found!'),
        ),
      ),
    );
  }
}
