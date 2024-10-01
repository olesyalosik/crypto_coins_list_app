import 'package:flutter/material.dart';

final ThemeData appTheme_dark = ThemeData(
  primarySwatch: Colors.amber,
  primaryColor: Colors.yellow,
  scaffoldBackgroundColor: Colors.black12,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 15,
    ),
  ),
  dividerColor: Colors.grey,
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    centerTitle: true,
    backgroundColor: Colors.black12,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.w700,
    ),
  ),
);
