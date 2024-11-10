import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learn_flutter/core/providers/auth_provider.dart';

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey[300],
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Text(
            user?.name ??
                'Guest', // Display user's name or "Guest" if not available
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            user?.email ??
                'No email', // Display user's email or "No email" if not available
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
