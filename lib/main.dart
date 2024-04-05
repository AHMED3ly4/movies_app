import 'package:flutter/material.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/home_screen.dart';
import 'package:movies_app/tabs/home_tab/data/data_source/home_tab_api_data_source.dart';

void main() {
  HomeTabApiDataSource().getRecommendedMovies(page: 1, language: "en-US");
  runApp(MoviesApp());
}


class MoviesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme.themeData,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
      },

    );
  }
}
