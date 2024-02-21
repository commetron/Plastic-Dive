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
);
