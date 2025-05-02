import 'package:flutter/material.dart';
import 'widget/expenss.dart';

var kColorSchema = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 69, 59, 181),
);

var kdarkscema = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: kdarkscema.onPrimaryContainer,
        foregroundColor: kdarkscema.primaryContainer,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kdarkscema.onSecondaryContainer,
          foregroundColor: kdarkscema.primaryContainer,
        ),
      ),
      cardTheme: const CardTheme().copyWith(
        color: kdarkscema.onSecondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 7,
        ),
      ),
    ),
    theme: ThemeData().copyWith(
      colorScheme: kColorSchema,
      appBarTheme: AppBarTheme(
        backgroundColor: kColorSchema.onPrimaryContainer,
        foregroundColor: kColorSchema.primaryContainer,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorSchema.primaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontSize: 18,
              color: kColorSchema.onSecondaryContainer,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              fontSize: 18,
              color: kColorSchema.primary,
            ),
          ),
      cardTheme: CardTheme(
          color: kColorSchema.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7)),
    ),
    themeMode: ThemeMode.system,
    home: const Expenss(),
  ));
}
