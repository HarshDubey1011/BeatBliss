// login_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beatbliss/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => loginController.username.value = value,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => loginController.password.value = value,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: loginController.login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: loginController.profileScreen,
              child: const Text('Profile Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
