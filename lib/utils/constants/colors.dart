import 'package:flutter/material.dart';

class TColors {
  TColors._();

  // App Basic Colors (الألوان الأساسية لهوية التطبيق)

  static const Color primary = Color(0xff002583);
  static const Color secondry = Color(0xffffE24b);
  static const Color accent = Color(0x0ffbc7ff);

  // Text Colors (ألوان النصوص في كل الشاشات)

  static const Color textprimary = Color(0XFF333333);
  static const Color textsecondry = Color(0XFF6C757D);
  static const Color textwhite = Colors.white;

  // Background Colors (ألوان خلفيات الصفحات بالكامل)

  static const Color light = Color(0XFFF6F6F6);
  static const Color dark = Color(0XFF272727);
  static const Color primaryBackground = Color(0XFFF3F5FF);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = Colors.white.withValues(alpha: 0.1);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softgrey = Color(0xfff4f4f4);
  static const Color lightgrey = Color(0xfff9f9f9);
  static const Color white = Color(0xffffffff);


  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xFFFF9A9E),
      Color(0xFFFAD0C4),
      Color(0xFFFAD0C4),
    ],
  );
} 

