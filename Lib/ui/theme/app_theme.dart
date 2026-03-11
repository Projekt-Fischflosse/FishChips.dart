import 'package:flutter/material.dart';

class AppTheme {
  static const Color fichBlue = Color(0xFF2F80ED);
  static const Color fichDarkBlue = Color(0xFF1B4F9C);

  static const Color chipsYellow =  Color(0xFFFFC107);
  static const Color chipsOrange =  Color(0xFFF59E0B);

  static const Color bg = Color(0xFFF5FAFF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color text = Color(0XFF0F172A);

  static ThemeData light() {
    // Erst ein Basis-Scheme erzeugen, dann mit copyWith überschreiben
    final base = ColotrScheme.fromSeed(seedColor: fishBlue,
    brightness: Brightness.light);

    final scheme = base.copyWith(
      primary: fishBlue,
      onPrimary: Colors.white,
      // ✅ statt background/onBackground: surface/onSurface
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
      ),//AppBarTheme

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: fishBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
      ),//ElevatedButtonThemeData

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: fishBlue,
          side: const BorderSide(color: fishBlue, width: 1.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),//OutlinedButtonThemeData

      flaotingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: chipsYellow,
        foregroundColor: Color(0xFF111827),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: text,
        ),//Textstyle
        bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: text,
        ),//TextStyle
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: text,
        ),
      ),//TextTheme
      dividerTheme: const DividerThemeData(
        color: Color(0x140000000),
        thickness: 1.2,
        space: 24,
      ),//DividerThemeData
    );//ThemeData
    }

      /// Einheitlicher Card-Style
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
