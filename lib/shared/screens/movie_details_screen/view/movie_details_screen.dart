import 'package:flutter/material.dart';
import 'package:movies_app/shared/data/movie.dart';
import 'package:movies_app/shared/screens/movie_details_screen/view/widget/more_like_this_section.dart';
import 'package:movies_app/shared/screens/movie_details_screen/view/widget/movie_details_section.dart';


class MovieDetailsScreen extends StatelessWidget {
  static const routeName='movie details route name';

  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movie =ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.title ?? '',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieDetailsSection(movie: movie),
            MoreLikeThisSection(movieID: movie.id.toString()),
          ],
        ),
      ),
    );
  }
}
