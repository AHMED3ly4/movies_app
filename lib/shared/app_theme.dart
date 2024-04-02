import 'package:flutter/material.dart';

class AppTheme{
static const whiteColor=Colors.white;
static const goldColor=Color(0xFFFFBB3B);
static const greyColor=Color(0xFFB5B4B4);
static ThemeData themeData= ThemeData.dark().copyWith(

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: goldColor,
    unselectedItemColor: Colors.white,
    unselectedLabelStyle: TextStyle(
      color: whiteColor,
    ),
  ),
  textTheme: TextTheme(
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: greyColor
    ),
  ),
);
}