import 'package:flutter/material.dart';

const _primary = Color(0xff006D67);
const _secondary = Color(0xff7EB8AA);
const _tertiary = Color.fromARGB(255, 0, 157, 149);
const _onSecondary = Colors.white;
const _onBackground = Color(0xff78D8D2);

mixin AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: _primary,
      secondary: _secondary,
      tertiary: _tertiary,
      onSecondary: _onSecondary,
      onBackground: _onBackground,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 84,
        color: _primary,
      ),
      displayMedium: TextStyle(
        fontSize: 72,
        color: _primary,
      ),
      displaySmall: TextStyle(
        fontSize: 60,
        color: _primary,
      ),
      titleLarge: TextStyle(
        fontSize: 48,
        color: _primary,
      ),
      titleMedium: TextStyle(
        fontSize: 36,
        color: _primary,
      ),
      titleSmall: TextStyle(
        fontSize: 30,
        color: _primary,
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        color: _primary,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        color: _primary,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        color: _primary,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        color: _primary,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        color: _primary,
      ),
      bodySmall: TextStyle(
        fontSize: 10,
        color: _primary,
      ),
    ),
  );

  static ThemeData dark = light;
}
