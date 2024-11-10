import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/providers/auth_provider.dart';
import 'routes/app_router.dart';

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

class LearnFlutter extends StatelessWidget {
  const LearnFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return MaterialApp(
      onGenerateRoute: (settings) => AppRouter.generateRoute(context, settings),
      initialRoute: authProvider.isAuthenticated ? '/home' : '/login',
    );
  }
}
