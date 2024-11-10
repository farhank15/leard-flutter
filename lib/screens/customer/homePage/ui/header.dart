import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learn_flutter/core/providers/auth_provider.dart';

class Header extends StatelessWidget {
  final String userName;
  final String email;

  const Header({
    super.key,
    required this.userName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.5)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Account Icon to open Drawer
          IconButton(
            icon: const Icon(Icons.account_circle, size: 24.0),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, size: 24.0),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings, size: 24.0),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Drawer Content
class CustomDrawer extends StatelessWidget {
  final String userName;
  final String email;

  const CustomDrawer({
    super.key,
    required this.userName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Icon(Icons.account_circle,
                  size: 48.0, color: Colors.grey[800]),
            ),
          ),
          ListTile(
            leading: Icon(Icons.add_circle),
            title: Text('Tambah Akun'),
            onTap: () {
              // Handle adding account
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Riwayat Mendengarkan'),
            onTap: () {
              // Handle navigation to listening history
              Navigator.pop(context); // Close the drawer
            },
          ),
          Divider(), // Separate the logout section

          // Logout button
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () async {
              final authProvider =
                  Provider.of<AuthProvider>(context, listen: false);
              await authProvider.logout();

              // Navigate to login screen and clear navigation stack
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
