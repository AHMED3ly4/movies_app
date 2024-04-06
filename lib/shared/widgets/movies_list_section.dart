import 'package:flutter/material.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/data/movie.dart';
import 'package:movies_app/shared/widgets/movies_list_section_item.dart';

class MoviesListSection extends StatelessWidget {
  final String label;
  final bool hasBottomDescription;
  final List<Movie> movies;
   const MoviesListSection(this.label, this.movies, {super.key, this.hasBottomDescription =false});

  @override
  Widget build(BuildContext context) {
    final screenHeight =MediaQuery.of(context).size.height;
    return Container(
      height: hasBottomDescription? screenHeight * 0.3:screenHeight * 0.26,
      color: AppTheme.darkGreyColor,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Expanded(
            child: ListView.builder(
              itemCount:movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => MoviesListSectionItem(movie: movies[index],hasBottomDescription: hasBottomDescription,),
            ),
          ),
        ],
      ),
    );
  }
}
