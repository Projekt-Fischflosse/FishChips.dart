import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    final base = ThemeData.light(useMaterial3: true);

    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E88E5)),
      scaffoldBackgroundColor: const Color(0xFFF6F7FB),
      textTheme: base.textTheme.copyWith(
        headlineMedium: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
        titleLarge: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        bodyMedium: const TextStyle(fontSize: 15, height: 1.35),
      ),
        cardTheme: const CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
    ),
    );
  }
}