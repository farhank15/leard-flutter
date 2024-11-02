import 'package:flutter/material.dart';
import '../../routes/guest_routes.dart';
import './validators/signup_validators.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Placeholder
                  const Image(
                    image: AssetImage("images/logo.png"),
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Daftar',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildTextField(
                    'Masukan Email',
                    false,
                    (value) => SignUpValidators.validateEmail(value),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    'Masukan Password',
                    true,
                    (value) => SignUpValidators.validatePassword(value),
                    controller: passwordController,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    'Masukan kembali Password',
                    true,
                    (value) => SignUpValidators.validateConfirmPassword(
                        value, passwordController.text),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sudah memiliki akun ?',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () => GuestRoutes.navigateToSignIn(context),
                        child: const Text(
                          'Masuk',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        // Perform signup action if validation succeeds
                        GuestRoutes.navigateToHome(context);
                      }
                    },
                    child: const Text(
                      'Daftar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    bool isPassword,
    String? Function(String?)? validator, {
    TextEditingController? controller,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
      ),
      validator: validator,
    );
  }
}
