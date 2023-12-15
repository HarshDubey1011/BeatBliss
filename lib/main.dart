import 'package:beatbliss/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beatbliss/screens/splash_screen.dart';
import 'package:beatbliss/screens/songs_screen.dart';
import 'package:beatbliss/screens/song_details_screen.dart';
import 'package:beatbliss/screens/song_details_screen.dart';
import 'package:beatbliss/screens/favorites_screen.dart';

// Define your color scheme
final ColorScheme myColorScheme = ColorScheme(
  primary: Colors.blue, // Primary color for app bars, buttons, etc.
  secondary: Colors.pink, // Secondary color for floating action buttons, etc.
  surface: Colors.white, // Surface color (background color of cards, etc.)
  background: Colors.white, // Background color of the entire app
  error: Colors.red, // Color for error messages, etc.
  onPrimary: Colors.white, // Color for text and icons on primary color
  onSecondary: Colors.black, // Color for text and icons on secondary color
  onSurface: Colors.black87, // Color for text and icons on surfaces
  onBackground: Colors.black, // Color for text and icons on the background
  onError: Colors.white, // Color for text and icons on error color
  brightness: Brightness.light, // Brightness of the overall theme
);

// Define your theme
final ThemeData myTheme = ThemeData(
  colorScheme: myColorScheme,
  primaryColor: myColorScheme.primary,
  scaffoldBackgroundColor: myColorScheme.background,
  appBarTheme: AppBarTheme(
    color: myColorScheme.primary,
    iconTheme: IconThemeData(color: myColorScheme.onPrimary),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(myColorScheme.primary),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          color: myColorScheme.onPrimary,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: myColorScheme.primary,
      textStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      theme: myTheme,
    );
  }
}
