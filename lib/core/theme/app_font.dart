import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:susil_flutter_portfolio/core/theme/app_color.dart';

/// Centralized typography system
/// - One font family
/// - Limited, consistent scale
/// - Theme-safe (no hardcoded colors)
class AppFont {
  AppFont._();

  // Base font (easy to switch later)
  static final TextStyle _base = GoogleFonts.inter();

  // Font weights
  static final TextStyle regular =
      _base.copyWith(fontWeight: FontWeight.w400);

  static final TextStyle medium =
      _base.copyWith(fontWeight: FontWeight.w500);

  static final TextStyle semiBold =
      _base.copyWith(fontWeight: FontWeight.w600);

  static final TextStyle bold =
      _base.copyWith(fontWeight: FontWeight.w700);
}

/// Font size scale (LIMITED on purpose)
/// Prevents design inconsistency
extension AppFontSize on TextStyle {
  TextStyle get s12 => copyWith(fontSize: 12.sp);
  TextStyle get s14 => copyWith(fontSize: 14.sp);
  TextStyle get s16 => copyWith(fontSize: 16.sp);
  TextStyle get s18 => copyWith(fontSize: 18.sp);
  TextStyle get s20 => copyWith(fontSize: 20.sp);
  TextStyle get s24 => copyWith(fontSize: 24.sp);
  TextStyle get s32 => copyWith(fontSize: 32.sp);
}

/// Theme-aware text colors
/// Uses ThemeData instead of hardcoded colors
extension AppFontColor on TextStyle {

  TextStyle primary(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.onSurface);

  TextStyle secondary(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant);

  TextStyle muted(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.outline);

  TextStyle accent(BuildContext context) =>
      copyWith(color: Theme.of(context).colorScheme.secondary);

  TextStyle success(BuildContext context) =>
      copyWith(color: AppColor.success);
}

