import 'package:flutter/material.dart';

import 'app_colors.dart';

import 'package:google_fonts/google_fonts.dart';

abstract final class AppTheme {
  static final ThemeData lightTheme = _buildLightTheme();

  static ThemeData _buildLightTheme() {
    final colorScheme = ColorScheme.light(
      primary: AppColors.buttonPrimary,
      onPrimary: AppColors.textQuaternary,
      surface: AppColors.backgroundPrimary,
      onSurface: AppColors.textPrimary,
      outline: AppColors.borderPrimary,
    );

    final baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.backgroundPrimary,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme).copyWith(
        titleLarge: baseTheme.textTheme.titleLarge?.copyWith(
          color: AppColors.textPrimary,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: baseTheme.textTheme.titleMedium?.copyWith(
          color: AppColors.textTertiary,
          fontSize: 13,
          fontWeight: FontWeight.normal,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundPrimary,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          foregroundColor: AppColors.textQuaternary,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
