import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    // ----------------- AppBar -----------------
    appBarTheme: AppBarThemeData(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.transparent,
      iconTheme: const IconThemeData(color: AppColors.gold),
      titleTextStyle: AppTextStyles.titleLarge(),
    ),
    // ----------------- Divider -----------------
    dividerTheme: const DividerThemeData(color: AppColors.white),
    // ------------------ Circular Progress -----------------
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.gold,
    ),
    // ----------------- Navigation Bar -----------------
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: .fixed,
      backgroundColor: AppColors.gold,
      elevation: 0,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.black,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedLabelStyle: AppTextStyles.bodySmall().copyWith(height: 2),
    ),
    // ----------------- List Tile -------------------
    listTileTheme: ListTileThemeData(
      titleTextStyle: AppTextStyles.bodyLarge(fontSize: 20),
      subtitleTextStyle: AppTextStyles.bodyMedium(),
    ),
    // ----------------- Input Decoration -----------
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.black60,
      hintStyle: AppTextStyles.bodyLarge(color: AppColors.offWhite),
    ),
    // ---------------- Text Theme -----------------
    textTheme: TextTheme(
      headlineSmall: AppTextStyles.headlineSmall(),
      titleLarge: AppTextStyles.titleLarge(),
      bodyLarge: AppTextStyles.bodyLarge(),
      bodyMedium: AppTextStyles.bodyMedium(),
      bodySmall: AppTextStyles.bodySmall(),
    ),
  );
}
