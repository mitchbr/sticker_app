import 'package:flutter/material.dart';

class CustomTheme {
  var primaryColor = const Color(0xFFDDD8AB);
  var secondaryColor = const Color(0xFFC2BD8E);

  var accentHighlightColor = const Color(0xFFA6469F);
  var accentColor = const Color(0xFFD45CCD);

  var textColor = Colors.black;

  ThemeData customTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: primaryColor,
      appBarTheme: AppBarTheme(
        color: secondaryColor,
      ),
      buttonTheme: ButtonThemeData(buttonColor: accentColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: secondaryColor,
        unselectedItemColor: accentColor,
        selectedItemColor: accentHighlightColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: textColor,
          padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 20),
          backgroundColor: accentColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: accentColor),
        ),
      ),
      fontFamily: 'Georgia',
      colorScheme: const ColorScheme.light().copyWith(background: primaryColor),
    );
  }

  InputDecoration textFormDecoration(label) {
    return InputDecoration(
      labelText: label,
      floatingLabelStyle: TextStyle(color: accentHighlightColor),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: accentHighlightColor),
      ),
    );
  }

  InputDecoration textFormIconDecoration(label, icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Align(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: Icon(
          icon,
          color: accentColor,
        ),
      ),
      floatingLabelStyle: TextStyle(color: accentHighlightColor),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: accentHighlightColor),
      ),
    );
  }
}
