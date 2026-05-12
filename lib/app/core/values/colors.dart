import 'package:flutter/material.dart';

class AppColors {
  // Background
  static const Color background = Color(0xFF0F0F11);

  // Gradient colors
  static const Color primaryPink = Color(0xFFFF5EA8);
  static const Color primaryPurple = Color(0xFF9B5CFF);

  // Text
  static const Color white = Color(0xFFFFFFFF);
  static const Color white70 = Color(0xB3FFFFFF);

  // Effects
  static const Color pinkGlow = Color(0x66FF5EA8);
  static const Color glassWhite = Color(0x0DFFFFFF);

  // Soft gradient
  static const Color lightPink = Color(0x40FF5EA8);
  static const Color lightPurple = Color(0x269B5CFF);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryPink, primaryPurple],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [lightPink, lightPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
