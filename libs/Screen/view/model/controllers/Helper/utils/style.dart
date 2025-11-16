import 'package:flutter/material.dart';

class Stylecolor {
  // Primary app color
  static const Color primary = Color(0xFF3461FD);
   static final Color filledBackground2 = Colors.grey.shade200;
   
  // Background color for screens
  static const Color background = Color(0xFFF5F6FA);

  // Accent colors
  static const Color accentPink = Color(0xFFFF0088);
  static const Color accentBlue = Color(0xFF1877F2);
  static const Color accentRed = Color(0xFFDB4437);


  // Text colors
  static const Color textDark = Color(0xFF1E1E1E);
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textGrey = Color(0xFF6C6C6C);

  // Divider color
  static const Color divider = Color(0xFFE0E5EC);
}

class Stylestext {
  // Headline
  static const TextStyle headline = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Stylecolor.primary,
  );

  // Subtitle
  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Stylecolor.textGrey,
  );

  // Button text
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Stylecolor.textLight,
  );

  // Normal text
  static const TextStyle normal = TextStyle(
    fontSize: 14,
    color: Stylecolor.textDark,
  );
}
