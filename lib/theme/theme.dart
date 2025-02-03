import 'package:flutter/material.dart';

import 'custom_theme/text_form_theme.dart';

class EAppTheme {
  EAppTheme._();

  
// LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: ETextFieldTheme.lightInputDecorationTheme
  );


// DARK THEME
    static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    inputDecorationTheme: ETextFieldTheme.darkInputDecorationTheme,
  );
}