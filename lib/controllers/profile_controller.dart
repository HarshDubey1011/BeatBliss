// profile_controller.dart

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beatbliss/screens/login_screen.dart';

class ProfileController extends GetxController {
  var username = ''.obs;
  var email = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('username') ?? '';
    email.value = prefs.getString('email') ?? '';
    print('Username: ${username.value}');
    print('Email: ${email.value}');
  }

  void logout() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.clear(); // Clear all stored values
    Get.to(LoginScreen()); // Navigate to the login screen
  }
}
