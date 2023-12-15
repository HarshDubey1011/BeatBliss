// signup_controller.dart

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beatbliss/screens/login_screen.dart';

class SignupController extends GetxController {
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  Future<void> signUp() async {
    // Check if all values are provided
    if (username.value.isNotEmpty &&
        email.value.isNotEmpty &&
        password.value.isNotEmpty) {
      // Save user details to SharedPreferences
      await saveUserDetails();

      // Navigate to the login screen
      Get.to(LoginScreen()); // Use named route if you have one
    } else {
      // Display an error message
      Get.snackbar('Error', 'Please provide all three values');
    }
  }

  Future<void> saveUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save user details to SharedPreferences
    prefs.setString('username', username.value);
    prefs.setString('email', email.value);
    prefs.setString('password', password.value);
  }
}
