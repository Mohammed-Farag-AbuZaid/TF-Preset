import 'package:flutter/material.dart';

class TColors {
  TColors._();

  // Minimalist TF Design Tokens
  static const Color primary = Color(0xFF002583);
  static const Color secondry = Color(0xFF002583);
  static const Color accent = Color(0xFF002583);

  // Text Colors
  static const Color textprimary = Color(0xFF1D1D1F);
  static const Color textsecondry = Color(0xFF6E6E73);
  static const Color textwhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF1D1D1F);
  static const Color primaryBackground = Color(0xFFFFFFFF);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF5F5F7);
  static Color darkContainer = Colors.white.withValues(alpha: 0.1);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF002583);
  static const Color buttonSecondary = Color(0xFF6E6E73);
  static const Color buttonDisabled = Color(0xFFD2D2D7);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD2D2D7);
  static const Color borderSecondary = Color(0xFFE5E5EA);

  // Error and Validation Colors
  static const Color error = Color(0xFFB3261E);
  static const Color success = Color(0xFF1F7A3E);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF002583);

  // Neutral Shades
  static const Color black = Color(0xFF1D1D1F);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF6E6E73);
  static const Color grey = Color(0xFFD2D2D7);
  static const Color softgrey = Color(0xFFF5F5F7);
  static const Color lightgrey = Color(0xFFFAFAFC);
  static const Color white = Color(0xFFFFFFFF);

  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFF5F5F7),
    ],
  );
}
