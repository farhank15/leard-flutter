import 'package:flutter/material.dart';
import 'routes/guest_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: GuestRoutes.splash, // Mulai dari SplashScreen
      routes: GuestRoutes.routes,
    );
  }
}
