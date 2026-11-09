import 'package:flutter/material.dart';

/// TF Unions Official Brand Identity:
/// Deep TF Navy (0xFF071A45), Signal Gold (0xFFE5A000), Warm Canvas (0xFFF3F2EE),
/// Sharp structural ink (0xFF111318), and zero generic AI clichés.
class TColors {
  TColors._();

  // Core Brand Tokens
  static const Color primary = Color(0xFF071A45);       // Deep TF Navy
  static const Color secondry = Color(0xFFE5A000);      // Signal Gold
  static const Color accent = Color(0xFFE5A000);        // Signal Gold Accent

  // Text Colors (High Contrast Sharp Ink)
  static const Color textprimary = Color(0xFF111318);   // Sharp Ink
  static const Color textsecondry = Color(0xFF52555E);  // Readable Slate Copy
  static const Color textwhite = Colors.white;

  // Background Canvas Colors
  static const Color light = Color(0xFFF3F2EE);         // Warm Architectural Canvas
  static const Color dark = Color(0xFF04102E);          // Deep Midnight Navy
  static const Color primaryBackground = Color(0xFFF3F2EE);

  // Container & Card Surfaces
  static const Color lightContainer = Color(0xFFFFFFFF); // Pure White Surface
  static const Color surfaceAlt = Color(0xFFFAF9F5);     // Architectural Stone Inset
  static Color darkContainer = const Color(0xFF071A45);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF071A45);  // Deep Navy Action
  static const Color buttonSecondary = Color(0xFFE5A000);// Signal Gold
  static const Color buttonDisabled = Color(0xFFD4D1C7);

  // Border & Hairline Colors
  static const Color borderPrimary = Color(0xFF111318);  // Sharp Architectural Boundary
  static const Color borderSecondary = Color(0xFFD4D1C7);// Inner Divider

  // Status & Validation Colors
  static const Color error = Color(0xFF991B1B);          // Red 800
  static const Color success = Color(0xFF065F46);        // Emerald 800
  static const Color warning = Color(0xFFD97706);        // Amber 600
  static const Color info = Color(0xFF071A45);           // Deep Navy

  // Neutral Palette
  static const Color black = Color(0xFF111318);
  static const Color darkerGrey = Color(0xFF2E3138);
  static const Color darkGrey = Color(0xFF52555E);
  static const Color grey = Color(0xFF858892);
  static const Color softgrey = Color(0xFFD4D1C7);
  static const Color lightgrey = Color(0xFFFAF9F5);
  static const Color white = Color(0xFFFFFFFF);

  // Official TF Navy to Gold Architectural Gradient
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF071A45),
      Color(0xFF04102E),
    ],
  );
}
