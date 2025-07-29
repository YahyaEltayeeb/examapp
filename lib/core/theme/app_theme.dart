import 'package:examapp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData getTheme({
    required ColorScheme colorScheme,
    required Color textFieldBorderColor,
  }) {
    return ThemeData(
      colorScheme: colorScheme,
      filledButtonTheme: FilledButtonThemeData(
        style: ElevatedButton.styleFrom(foregroundColor: colorScheme.primary),
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(
          fontWeight: FontWeight.w500,
          color: colorScheme.secondary,
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.lightGrey,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w400,
          color: textFieldBorderColor,
        ),
        labelLarge: TextStyle(
          fontWeight: FontWeight.w500,
          color: colorScheme.onPrimary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        counterStyle: TextStyle(color: colorScheme.primary),
        helperStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: colorScheme.error,
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.lightGrey,
        ),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: textFieldBorderColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textFieldBorderColor),
          borderRadius: BorderRadius.circular(4),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textFieldBorderColor),
          borderRadius: BorderRadius.circular(4),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.error,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: textFieldBorderColor,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: textFieldBorderColor,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightBlue,
      
      ),
    );
  }

  static ThemeData lightTheme = getTheme(
    textFieldBorderColor: const Color(0xff535353),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.blue,
      onPrimary: AppColors.white,
      secondary: AppColors.black,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.blue,
    ),
  );
}
