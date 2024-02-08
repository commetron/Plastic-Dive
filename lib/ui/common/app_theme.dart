import 'package:flutter/material.dart';

const buttonTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.w700,
);

final smallButtonTextStyle = buttonTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400);

final appTheme = ThemeData(
  fontFamily: 'PixeloidSans',
  scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
);
