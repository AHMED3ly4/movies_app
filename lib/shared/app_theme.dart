import 'package:flutter/material.dart';

class AppTheme{
static const whiteColor=Colors.white;
static const goldColor=Color(0xFFFFBB3B);
static ThemeData themeData= ThemeData.dark().copyWith(

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: goldColor,
    unselectedItemColor: Colors.white,
    unselectedLabelStyle: TextStyle(
      color: whiteColor,
    ),
  ),
);
}