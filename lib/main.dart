import 'package:flutter/material.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/home_screen.dart';
import 'package:movies_app/shared/providers/watchlist_provider.dart';
import 'package:movies_app/shared/screens/movie_details_screen/view/movie_details_screen.dart';
import 'package:movies_app/tabs/browse_tab/view/screens/category_movies_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
        create: (context) => WatchlistProvider(),
      child: MoviesApp(),
    )
  );
}


class MoviesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Provider.of<WatchlistProvider>(context,listen: false).getWatchListMovies();
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
