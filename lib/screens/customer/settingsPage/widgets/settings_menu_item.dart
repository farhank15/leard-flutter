import 'package:flutter/material.dart';

class SettingsMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  SettingsMenuItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
