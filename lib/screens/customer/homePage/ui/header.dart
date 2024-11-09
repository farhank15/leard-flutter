import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String userName;

  const Header({
    super.key,
    required this.userName,
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
          // Icon Profil
          IconButton(
            icon: const Icon(Icons.account_circle, size: 24.0),
            onPressed: () {},
          ),
          // Hilangkan title jika tidak diperlukan
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
