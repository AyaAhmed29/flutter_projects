import 'package:flutter/material.dart';
import 'app_colors.dart';

////https://nti-ecommerce-api-production-e1c2.up.railway.app/api/
class AppTheme {
  // ---------------------- Light Theme ----------------------
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: AppColors.pink,
      scaffoldBackgroundColor: AppColors.lightGrey,
      textTheme: _textTheme(AppColors.black),
      appBarTheme: _appBarTheme(
        background: AppColors.lightGrey,
        color: AppColors.black,
      ),
      inputDecorationTheme: _inputTheme(
        fill: AppColors.lightGrey,
        hint: Colors.grey[500]!,
      ),
      textSelectionTheme: _textSelectionTheme(),
      iconTheme: const IconThemeData(color: AppColors.black),
      elevatedButtonTheme: _buttonTheme(),
      colorScheme: const ColorScheme.light(
        surface: Colors.white,
        onSurface: Colors.black,
      ),
    );
  }

  // ---------------------- Dark Theme ----------------------
  static ThemeData darkTheme() {
    return ThemeData(
      primaryColor: AppColors.pink,
      scaffoldBackgroundColor: const Color(0xff1C1C1C),
      textTheme: _textTheme(AppColors.white),
      appBarTheme: _appBarTheme(
        background: const Color(0xff1C1C1C),
        color: AppColors.white,
      ),
      inputDecorationTheme: _inputTheme(
        fill: AppColors.black.withValues(alpha: 0.8),
        hint: AppColors.grey,
      ),
      textSelectionTheme: _textSelectionTheme(),
      iconTheme: const IconThemeData(color: Colors.white70),
      elevatedButtonTheme: _buttonTheme(),
      colorScheme: const ColorScheme.dark(
        surface: Colors.black,
        onSurface: Colors.white,
      ),
    );
  }

  // ---------------------- Shared Styles ----------------------
  static TextTheme _textTheme(Color color) {
    return TextTheme(
      bodyLarge: TextStyle(color: color),
      bodyMedium: TextStyle(color: color),
      bodySmall: TextStyle(color: color),
      titleLarge: TextStyle(color: color),
      titleMedium: TextStyle(color: color),
      titleSmall: TextStyle(color: color),
    );
  }

  static AppBarTheme _appBarTheme({
    required Color background,
    required Color color,
  }) {
    return AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: background,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: color),
      titleTextStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  static InputDecorationTheme _inputTheme({
    required Color fill,
    required Color hint,
  }) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fill,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      hintStyle: TextStyle(color: hint),
    );
  }

  static TextSelectionThemeData _textSelectionTheme() {
    return TextSelectionThemeData(
      cursorColor: AppColors.pink,
      selectionColor: AppColors.lightPink,
      selectionHandleColor: AppColors.lightPink,
    );
  }

  static ElevatedButtonThemeData _buttonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.pink,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
