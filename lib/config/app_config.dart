class AppConfig {
  static const String baseUrl = 'https://api.investment-app.com';
  static const String apiVersion = 'v1';
  
  static Future<void> initialize() async {
    // Initialize dependencies, Firebase, etc.
  }
  
  static String get apiUrl => '$baseUrl/$apiVersion';
}

// lib/core/constants/app_constants.dart
class AppConstants {
  // Colors
  static const primaryColor = 0xFF2E7D32;
  static const secondaryColor = 0xFF388E3C;
  static const errorColor = 0xFFD32F2F;
  
  // Strings
  static const String appName = 'Investment App';
  static const String loginTitle = 'Welcome Back';
  static const String homeTitle = 'Dashboard';
  
  // API Keys
  static const String storageKey = 'investment_app_storage';
}