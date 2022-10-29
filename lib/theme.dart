// ignore_for_file: prefer_const_declarations, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final Color _lightPrimaryColor = Colors.blueGrey.shade50;
  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static final Color _lightOnPrimaryColor = Colors.blueGrey.shade200;
  static final Color _lightTextColorPrimary = Colors.black;
  static final Color _appbarColorLight = Colors.blue;

  static final Color _darkPrimaryColor = Color.fromARGB(255, 0, 33, 59);
  static final Color _darkPrimaryVariantColor = Colors.black;
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static final Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;

  static const Color _iconColor = Colors.white;

  static const Color _accentColorDark = Color.fromRGBO(74, 217, 217, 1);

  //Light Theme Text Style
  static final TextStyle _lightHeadingText = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Rubik",
      fontSize: 25,
      fontWeight: FontWeight.bold);
  static final TextStyle _lightBodyText = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Rubik",
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      fontSize: 20);

  static final TextTheme _lightTextTheme = TextTheme(
    headline1: _lightHeadingText,
    bodyText1: _lightBodyText,
  );

  //Form Design Theme
  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    //Label innerhalb von Textfeldern
    floatingLabelStyle: const TextStyle(color: Colors.white),
    //Rahmen, wenn man ein Feld fokussiert
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.white)),
    //Genereller Rahmen um ein Textfeld herum
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  //Dark Theme Text Style
  //mit copyWith kopieren wir die Daten aus dem lightTheme und ändern einfach die Farbe
  static final TextStyle _darkHeadingText =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkBodyText =
      _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: _darkHeadingText,
    bodyText1: _darkBodyText,
  );

//Light Theme
  static final ThemeData lightTheme = ThemeData(
      inputDecorationTheme: _inputDecorationTheme,
      scaffoldBackgroundColor: _lightPrimaryColor,
      appBarTheme: AppBarTheme(
          color: _appbarColorLight,
          iconTheme: IconThemeData(color: _iconColor)),
      bottomAppBarColor: _appbarColorLight,
      colorScheme: ColorScheme.light(
          primary: _lightPrimaryColor,
          secondary: _accentColorDark,
          onPrimary: _lightOnPrimaryColor,
          primaryVariant: _lightPrimaryVariantColor),
      textTheme: _lightTextTheme);

//Dark Theme
  static final ThemeData darkTheme = ThemeData(
      inputDecorationTheme: _inputDecorationTheme,
      scaffoldBackgroundColor: _darkPrimaryColor,
      appBarTheme: AppBarTheme(
          color: _appbarColorDark, iconTheme: IconThemeData(color: _iconColor)),
      bottomAppBarColor: _appbarColorDark,
      colorScheme: ColorScheme.dark(
          primary: _darkPrimaryColor,
          secondary: _accentColorDark,
          onPrimary: _darkOnPrimaryColor,
          primaryVariant: _darkPrimaryVariantColor),
      textTheme: _darkTextTheme);
}
