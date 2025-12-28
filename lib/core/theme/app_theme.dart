import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_font.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColor.lightBackground,
  colorScheme: const ColorScheme.light(
    primary: AppColor.primary,
    secondary: AppColor.accent,

    surface: AppColor.lightBackground,
    onSurface: AppColor.lightTextPrimary,

    onSurfaceVariant: AppColor.lightTextSecondary,
    outline: AppColor.lightTextMuted,

    error: AppColor.error,
  ),
  textTheme: TextTheme(
    bodyMedium: AppFont.regular,
  ),
);


 static ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColor.darkBackground,
  colorScheme: const ColorScheme.dark(
    primary: AppColor.primary,
    secondary: AppColor.accent,

    surface: AppColor.darkBackground,
    onSurface: AppColor.darkTextPrimary,

    onSurfaceVariant: AppColor.darkTextSecondary,
    outline: AppColor.darkTextMuted,

    error: AppColor.error,
  ),
  textTheme: TextTheme(
    bodyMedium: AppFont.regular,
  ),
);

}
