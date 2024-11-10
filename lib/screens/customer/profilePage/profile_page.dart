import 'package:flutter/material.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_input_field.dart';

class ProfilePage extends StatelessWidget {
  // Define controllers for each input field
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 8.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 8.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Profile Header
            ProfileHeader(
              fullName: 'Nama Lengkap',
              university: 'Asal Universitas',
            ),
            SizedBox(height: 8), // Reduced spacing

            // Input Fields with Reduced Padding
            ProfileInputField(
              label: 'Email',
              controller: emailController,
            ),
            SizedBox(height: 8), // Reduced spacing
            ProfileInputField(
              label: 'Nama',
              controller: nameController,
            ),
            SizedBox(height: 8), // Reduced spacing
            ProfileInputField(
              label: 'Nomor Telepon',
              controller: phoneController,
            ),
            SizedBox(height: 8), // Reduced spacing
            ProfileInputField(
              label: 'Alamat',
              controller: addressController,
            ),
            SizedBox(height: 8), // Reduced spacing

            // Update Profile Button
            ElevatedButton(
              onPressed: () {
                // Handle profile update logic here
              },
              child: Text('Ubah Profil'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
