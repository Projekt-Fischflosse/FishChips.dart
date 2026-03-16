import 'package:flutter/material.dart';

class AppTheme {
  static const Color fichBlue = Color(0xFF2F80ED);
  static const Color fichDarkBlue = Color(0xFF1B4F9C);

  static const Color chipsYellow = Color(0xFFFFC107);
  static const Color chipsOrange = Color(0xFFF59E0B);

  static const Color bg = Color(0xFFF5FAFF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color text = Color(0xFF0F172A);

  static ThemeData light() {
    final base = ColorScheme.fromSeed(
      seedColor: fichBlue,
      brightness: Brightness.light,
    );

    final scheme = base.copyWith(
      primary: fichBlue,
      onPrimary: Colors.white,
      surface: surface,
      onSurface: text,
      secondary: chipsYellow,
      onSecondary: const Color(0xFF111827),
      error: const Color(0xFFEF4444),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: bg,

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: text,
        elevation: 0,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: fichBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: fichBlue,
          side: const BorderSide(color: fichBlue, width: 1.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: chipsYellow,
        foregroundColor: Color(0xFF111827),
      ),

      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: text,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: text,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: text,
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: Color(0x14000000),
        thickness: 1.2,
        space: 24,
      ),
    );
  }

  static Card themedCard({
    required Widget child,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
  }) {
    return Card(
      color: surface,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: const Color(0x14000000),
      child: Padding(padding: padding, child: child),
    );
  }
}
