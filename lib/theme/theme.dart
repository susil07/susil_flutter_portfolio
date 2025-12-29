import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Primary font family: Inter
  static final TextTheme _baseTextTheme = GoogleFonts.interTextTheme();

  // Vercel/Linear influenced minimal palette
  static const Color lightBackground = Colors.white;
  static const Color darkBackground = Color(0xFF0A0A0A); // Deep black/gray
  static const Color lightSurface = Color(0xFFF5F5F5);
  static const Color darkSurface = Color(0xFF1C1C1C);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBackground,
    colorScheme: ColorScheme.light(
      surface: lightBackground,
      primary: Colors.black,
      onPrimary: Colors.white,
      onSurface: Colors.black,
      secondary: Colors.grey[800]!,
    ),
    textTheme: _baseTextTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackground,
    colorScheme: ColorScheme.dark(
      surface: darkBackground,
      primary: Colors.white,
      onPrimary: Colors.black,
      onSurface: Colors.white,
      secondary: Colors.grey[400]!,
    ),
    textTheme: _baseTextTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
