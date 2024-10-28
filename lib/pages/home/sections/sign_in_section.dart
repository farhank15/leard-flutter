import 'package:flutter/material.dart';
import '../../../routes/guest_routes.dart';

class SignInSection extends StatelessWidget {
  const SignInSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () => AppRoutes.navigateToSignIn(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepPurple,
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        icon: const Icon(Icons.login),
        label: const Text(
          'Go to Sign In',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
