import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/providers/auth_provider.dart';
import 'routes/app_router.dart';
import 'common/custom_bottom_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authProvider = AuthProvider();
  await authProvider.loadToken();

  runApp(
    ChangeNotifierProvider(
      create: (_) => authProvider,
      child: const LearnFlutter(),
    ),
  );
}

class LearnFlutter extends StatefulWidget {
  const LearnFlutter({super.key});

  @override
  State<LearnFlutter> createState() => _LearnFlutterState();
}

class _LearnFlutterState extends State<LearnFlutter> {
  int _currentIndex = 0;

  void _onTabTapped(int index) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (index == 2) {
      // Index 2 untuk Logout
      await authProvider.logout();

      // Setelah logout, arahkan ke halaman login
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
        (Route<dynamic> route) => false, // Menghapus semua rute sebelumnya
      );
    } else {
      setState(() {
        _currentIndex = index;
      });

      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/akun');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return MaterialApp(
      onGenerateRoute: (settings) {
        final route = AppRouter.generateRoute(context, settings);

        // Jika pengguna sudah login, bungkus dengan Scaffold yang memiliki bottom navigation
        if (authProvider.isAuthenticated && route is MaterialPageRoute) {
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: route.builder(context),
              bottomNavigationBar: CustomBottomNavigation(
                currentIndex: _currentIndex,
                onTap: _onTabTapped,
              ),
            ),
          );
        }

        // Jika pengguna belum login, kembalikan route biasa
        return route;
      },
      initialRoute: authProvider.isAuthenticated ? '/home' : '/login',
    );
  }
}
