import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String fullName;
  final String university;

  ProfileHeader({required this.fullName, required this.university});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          fullName,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          university,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }
}
