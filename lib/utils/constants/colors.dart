import 'package:flutter/material.dart';

/// TF Unions Academic Vanguard Design Tokens
/// High-contrast tactile surfaces, Slate-50 canvas, elevated white cards,
/// Deep Academic Oxford Blue, Electric Cobalt actions, and zero generic AI clichés.
class TColors {
  TColors._();

  // Core Brand Tokens
  static const Color primary = Color(0xFF0A2540);       // Deep Academic Oxford Blue
  static const Color secondry = Color(0xFF0052FF);      // Electric Oxford Cobalt
  static const Color accent = Color(0xFFD97706);        // Scholar Honors Amber

  // Text Colors (High Contrast & Clear Readability)
  static const Color textprimary = Color(0xFF0F172A);   // Slate 900
  static const Color textsecondry = Color(0xFF475569);  // Slate 600
  static const Color textwhite = Colors.white;

  // Background Canvas Colors
  static const Color light = Color(0xFFF8FAFC);         // Slate 50 Canvas
  static const Color dark = Color(0xFF0F172A);          // Slate 900
  static const Color primaryBackground = Color(0xFFF8FAFC);

  // Background Container & Card Surfaces
  static const Color lightContainer = Color(0xFFFFFFFF); // Pure White Elevated Card
  static Color darkContainer = const Color(0xFF1E293B);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF0052FF);  // High-Affordance Cobalt
  static const Color buttonSecondary = Color(0xFFF1F5F9);// Inset Well / Neutral
  static const Color buttonDisabled = Color(0xFFCBD5E1);

  // Border & Hairline Colors
  static const Color borderPrimary = Color(0xFFE2E8F0);  // Slate 200 (Distinct Boundary)
  static const Color borderSecondary = Color(0xFFCBD5E1);// Slate 300 (Input / Hover)

  // Status & Validation Colors
  static const Color error = Color(0xFFDC2626);          // Red 600
  static const Color success = Color(0xFF059669);        // Emerald 600
  static const Color warning = Color(0xFFD97706);        // Amber 600
  static const Color info = Color(0xFF0052FF);           // Cobalt 600

  // Neutral Palette
  static const Color black = Color(0xFF0F172A);
  static const Color darkerGrey = Color(0xFF334155);
  static const Color darkGrey = Color(0xFF64748B);
  static const Color grey = Color(0xFFCBD5E1);
  static const Color softgrey = Color(0xFFF1F5F9);
  static const Color lightgrey = Color(0xFFF8FAFC);
  static const Color white = Color(0xFFFFFFFF);

  // Clean Non-AI Linear Gradient (Subtle Tone on Tone)
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xFF0A2540),
      Color(0xFF0052FF),
    ],
  );
}
