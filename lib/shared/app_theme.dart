import 'package:flutter/material.dart';

class AppTheme{
static const whiteColor=Colors.white;
static const blackColor=Color(0xFF121312);
static const goldColor=Color(0xFFFFBB3B);
static const greyColor=Color(0xFFB5B4B4);
static const darkGreyColor=Color(0xFF282A28);
static const lightGreyColor=Color(0xFF514F4F);


static ThemeData themeData= ThemeData.dark().copyWith(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: goldColor,
    unselectedItemColor: Colors.white,
    unselectedLabelStyle: TextStyle(
      color: whiteColor,
    ),
  ),
  scaffoldBackgroundColor: blackColor,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: whiteColor
    )
  ),
  textTheme: const TextTheme(
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