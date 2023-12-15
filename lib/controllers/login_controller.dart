// login_controller.dart
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:beatbliss/next_widget.dart';
import 'package:beatbliss/screens/songs_screen.dart';
import 'package:beatbliss/screens/profile_screen.dart';
import 'package:beatbliss/screens/home_page.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  Future<void> login() async {
    // Implement your login logic here
    print('Logging in with username: $username, password: $password');

    // Check if the entered credentials match the stored credentials
    bool credentialsMatch = await checkCredentials();

    if (credentialsMatch) {
      // Navigate to the next widget
      print('ohayo gozaimasu');
      Get.to(const HomePage());
    } else {
      // Display an error message
      print('error message');
      Get.snackbar('Error', 'Invalid username or password');
    }
  }

  Future<void> profileScreen() async {
    Get.to(ProfileScreen());
  }

  Future<bool> checkCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get the stored credentials from SharedPreferences
    String storedUsername = prefs.getString('username') ?? '';
    String storedPassword = prefs.getString('password') ?? '';

    // Compare the entered credentials with the stored credentials
    return username.value == storedUsername && password.value == storedPassword;
  }
}
