import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  // ─── BRAND ───────────────────────────────
  static const Color primary = Color(0xFF6366F1); // Indigo
  static const Color accent  = Color(0xFFF97316); // Orange (highlights)

  // ─── BACKGROUNDS ─────────────────────────
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color darkBackground  = Color(0xFF0F172A);

  // ─── TEXT (LIGHT) ────────────────────────
  static const Color lightTextPrimary   = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF6B7280);
  static const Color lightTextMuted     = Color(0xFF9CA3AF);

  // ─── TEXT (DARK) ─────────────────────────
  static const Color darkTextPrimary   = Color(0xFFE5E7EB);
  static const Color darkTextSecondary = Color(0xFF9CA3AF);
  static const Color darkTextMuted     = Color(0xFF6B7280);

  // ─── STATUS ──────────────────────────────
  static const Color success = Color(0xFF16A34A);
  static const Color error   = Color(0xFFDC2626);
}
