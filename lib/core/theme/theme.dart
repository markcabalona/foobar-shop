import 'package:flutter/material.dart';
import 'package:foobar_shop/core/constants/grid.dart';
import 'package:foobar_shop/core/theme/color_schemes.g.dart';
import 'package:google_fonts/google_fonts.dart';

/// `CustomTheme.lightTheme` returns ThemeData for light mode
///
/// `CustomTheme.darkTheme` returns ThemeData for dark mode
abstract class CustomTheme {
  static ThemeData _baseTheme({required ColorScheme colorScheme}) => ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        useMaterial3: true,
        colorScheme: colorScheme,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: CustomGrid.medium,
          ),
          alignLabelWithHint: true,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
          ),
        ),
      );
  static final ThemeData lightTheme = _baseTheme(
    colorScheme: lightColorScheme,
  );

  static final ThemeData darkTheme = _baseTheme(
    colorScheme: darkColorScheme,
  );
}
