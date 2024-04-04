import 'package:flutter/material.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/data/movie.dart';
import 'package:movies_app/shared/widgets/movies_list_section_item.dart';

class MoviesListSection extends StatelessWidget {
  final String label;
  final bool hasBottomDescription;
  final List<Movie> movies;
   MoviesListSection(this.label, this.movies, {this.hasBottomDescription =true});

  @override
  Widget build(BuildContext context) {
    final screenHeight =MediaQuery.of(context).size.height;
    final screenWidth =MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.26,
      color: AppTheme.darkGreyColor,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Released",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Expanded(

            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => MoviesListSectionItem(movie: movies[index]),
            ),
          ),
        ],
      ),
    );
  }
}
