import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: MaterialColor(AppConstants.primaryColor, {
        50: Color(0xFFE8F5E8),
        100: Color(0xFFC8E6C9),
        200: Color(0xFFA5D6A7),
        300: Color(0xFF81C784),
        400: Color(0xFF66BB6A),
        500: Color(AppConstants.primaryColor),
        600: Color(0xFF2E7D32),
        700: Color(0xFF2E7D32),
        800: Color(0xFF1B5E20),
        900: Color(0xFF1B5E20),
      }),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        backgroundColor: Color(AppConstants.primaryColor),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
  
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: Color(AppConstants.primaryColor),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(AppConstants.primaryColor),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}