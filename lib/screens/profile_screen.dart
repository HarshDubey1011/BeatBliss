import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beatbliss/controllers/profile_controller.dart';
import 'package:beatbliss/screens/login_screen.dart'; // Import the login screen

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${profileController.username}'),
            const SizedBox(height: 16),
            Text('Email: ${profileController.email}'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: profileController.logout,
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
