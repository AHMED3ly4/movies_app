import 'package:flutter/material.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/home_screen.dart';
import 'package:movies_app/shared/screens/movie_details_screen/view/movie_details_screen.dart';
import 'package:movies_app/tabs/browse_tab/data/data_source/browse_api_data_source.dart';
import 'package:movies_app/tabs/browse_tab/view/screens/category_movies_screen.dart';

void main() {
  BrowseAPIDataSource().searchCategoryMovies(28);
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
        MovieDetailsScreen.routeName : (context) => const MovieDetailsScreen(),
        CategoryMoviesScreen.routeName : (context) => const CategoryMoviesScreen(),
      },

    );
  }
}
