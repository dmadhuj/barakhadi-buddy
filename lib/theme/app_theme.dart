import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.onTertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        onTertiaryContainer: AppColors.onTertiaryContainer,
        error: AppColors.error,
        onError: AppColors.onError,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.onErrorContainer,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
      ),
      scaffoldBackgroundColor: AppColors.surface,
      textTheme: GoogleFonts.quicksandTextTheme().copyWith(
        displayLarge: GoogleFonts.quicksand(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.02,
          color: AppColors.onSurface,
        ),
        headlineMedium: GoogleFonts.quicksand(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.onSurface,
        ),
        bodyLarge: GoogleFonts.quicksand(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.onSurface,
        ),
        labelLarge: GoogleFonts.quicksand(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.05,
          color: AppColors.onSurface,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0, // We will use custom tactile buttons
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceContainerHighest,
        foregroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: false,
        shape: Border(bottom: BorderSide(color: AppColors.outlineVariant, width: 4)),
      ),
    );
  }
}
