import 'package:flutter/material.dart';

class ProfileInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  ProfileInputField({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0), // Reduced padding
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          isDense: true, // Reduces the height of the text field
          contentPadding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 12.0), // Adjusts padding within the text field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
        ),
      ),
    );
  }
}
