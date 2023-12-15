// splash_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beatbliss/controllers/splash_controller.dart';
import 'package:beatbliss/screens/login_screen.dart'; // Import the login screen
import 'package:beatbliss/screens/signup_screen.dart'; // Import the sign-up screen

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());

    // Delayed navigation to login or sign-up screen after 3 seconds
    Future.delayed(const Duration(seconds: 6), () {
      Get.offAll(
          SignUpScreen()); // Use Get.offAll to clear the splash screen from the navigation stack
      // Get.offAll(SignupScreen()); // Uncomment this line if you want to navigate to the sign-up screen
    });

    return Scaffold(
      backgroundColor: Colors.black, // Customize the background color
      body: Center(
        child: ScaleTransition(
          scale: splashController.animation,
          child: Image.asset(
            'assets/images/logo-no-background.png', // Replace with your music player icon
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
