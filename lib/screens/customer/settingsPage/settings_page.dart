import 'package:flutter/material.dart';
import 'widgets/profile_section.dart';
import 'widgets/settings_menu_item.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Profile Section
          ProfileSection(),
          Divider(),
          // Menu Items
          SettingsMenuItem(
            title: 'Kelola Akun',
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          SettingsMenuItem(
            title: 'Notifikasi',
            onTap: () {
              // Navigate to Notifications
            },
          ),
          SettingsMenuItem(
            title: 'Privacy Policy',
            onTap: () {
              // Navigate to Privacy Policy
            },
          ),
          SettingsMenuItem(
            title: 'Terms of Service',
            onTap: () {
              // Navigate to Terms of Service
            },
          ),
        ],
      ),
    );
  }
}
