// signup_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beatbliss/controllers/signup_controller.dart';
import 'package:beatbliss/screens/login_screen.dart'; // Import the login screen

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => signupController.username.value = value,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => signupController.email.value = value,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => signupController.password.value = value,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: signupController.signUp,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
