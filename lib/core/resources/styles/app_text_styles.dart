import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // --------------------- BODY TEXT ---------------------
  static TextStyle bodyLarge({
    Color color = AppColors.white,
    double fontSize = 16,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: 'Janna',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bodyMedium({
    Color color = AppColors.white,
    double fontSize = 14,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: 'Janna',
      fontWeight: .bold,
    );
  }

  static TextStyle bodySmall({
    Color color = AppColors.white,
    double fontSize = 12,
  }) {
    return TextStyle(fontSize: fontSize, color: color, fontFamily: 'Janna');
  }

  // --------------------- HEADLINE TEXT ---------------------
  static TextStyle headlineSmall({
    Color color = AppColors.black,
    double fontSize = 24,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: 'Janna',
      fontWeight: .bold,
    );
  }

  // --------------------- TITLE TEXT ---------------------
  static TextStyle titleLarge({
    Color color = AppColors.gold,
    double fontSize = 20,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: 'Janna',
      fontWeight: .bold,
    );
  }

  // --------------------- LABEL TEXT ---------------------

  static TextStyle labelMedium({
    Color color = AppColors.white,
    double fontSize = 14,
  }) {
    return TextStyle(fontSize: fontSize, color: color, fontFamily: 'Janna');
  }

  static TextStyle labelSmall({
    Color color = AppColors.white,
    double fontSize = 12,
  }) {
    return TextStyle(fontSize: fontSize, color: color, fontFamily: 'Janna');
  }
}
