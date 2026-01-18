import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background, // Your new Mint-White
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      
      // 🎨 FORCE NEW PALETTE MAPPING
      primary: AppColors.primary,      // Lighter Trust Green
      onPrimary: Colors.white,         // White text on green buttons
      secondary: AppColors.secondary,  // Olive Green
      tertiary: AppColors.accent,      // Golden Yellow (Highlights)
      surface: AppColors.card,         // White cards
      error: AppColors.danger,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.primary, // Ensures Header is Green
      foregroundColor: Colors.white,      // Ensures Title is White
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    // Using your Dark Green (textMain) or a standard dark color for background
    scaffoldBackgroundColor: const Color(0xFF1A1A1A), 
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      
      // 🌙 DARK MODE MAPPING
      primary: AppColors.secondary,    // Olive Green pops better on dark
      onPrimary: Colors.white,
      secondary: AppColors.primary,    // Trust Green as secondary
      tertiary: AppColors.accent,      // Gold stays as accent
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFF1A1A1A),
      foregroundColor: Colors.white,
    ),
  );
}