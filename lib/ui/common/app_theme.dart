import 'package:flutter/material.dart';

const buttonTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.w700,
);

final smallButtonTextStyle = buttonTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400);

final appTheme = ThemeData(
  // Colors
  fontFamily: 'PixeloidSans',
  scaffoldBackgroundColor: Colors.transparent,

  textTheme: const TextTheme(
    titleLarge: TextStyle(fontFamily: 'PixeloidSans', fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
    titleMedium: TextStyle(fontFamily: 'PixeloidSans', fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
    bodyLarge: TextStyle(fontFamily: 'PixeloidSans', fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
    bodyMedium: TextStyle(fontFamily: 'PixeloidSans', fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
    bodySmall: TextStyle(fontFamily: 'PixeloidSans', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
  ),

  // AppBar
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: const TextStyle(fontFamily: 'PixeloidSans', fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
    backgroundColor: Colors.white.withOpacity(0.3),
    elevation: 3,
    foregroundColor: Colors.white,
  ),

  // Divider + Line on persistentbuttons
  dividerColor: Colors.transparent,
  dividerTheme: const DividerThemeData(
    color: Colors.transparent,
  ),

  // Input
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white.withOpacity(0.3),
    filled: true,
    hintStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white),
    ),
  ),

  switchTheme: SwitchThemeData(
    materialTapTargetSize: MaterialTapTargetSize.padded,
    thumbColor: MaterialStateProperty.all(Colors.white),
    trackColor: MaterialStateProperty.all(Colors.white.withOpacity(0.3)),
    trackOutlineColor:
        MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? Colors.white : Colors.white.withOpacity(0.3)),
  ),
);
