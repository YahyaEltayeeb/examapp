import 'package:examapp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static getTheme({
    required ColorScheme colorScheme,
    required Color textFieldBorderColor,
  }) {
    return ThemeData(
      colorScheme: colorScheme,
      filledButtonTheme: FilledButtonThemeData(
        style: ElevatedButton.styleFrom(foregroundColor: colorScheme.primary),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.lightGrey,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w400,
          color: textFieldBorderColor,
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

        // Theme focusBorder
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textFieldBorderColor),
          borderRadius: BorderRadius.circular(4),
        ),

        // Theme DisableBorder
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textFieldBorderColor),
          borderRadius: BorderRadius.circular(4),
        ),

        //ThemeErrorBorder
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.error,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        //ThemeFocusedErrorBorder
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: textFieldBorderColor,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(4),
        ),

        // Theme EnableBorder
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: textFieldBorderColor,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  static ThemeData lightTheme = getTheme(
    textFieldBorderColor: Color(0xff535353),
    colorScheme: ColorScheme(
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
