import 'package:flutter/material.dart';
import 'package:movies_app/shared/data/movie.dart';
import 'package:movies_app/tabs/home_tab/view/widgets/movie_back_drop.dart';
import 'package:movies_app/tabs/home_tab/view/widgets/movie_poster.dart';

import '../../../../shared/screens/movie_details_screen/view/movie_details_screen.dart';


class PopularMovieItem extends StatelessWidget {
  final Movie movie;
  const PopularMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    final adult = movie.adult ?? false ? '+18':''  '';
    final screenHeight =MediaQuery.of(context).size.height;
    final screenWidth =MediaQuery.of(context).size.width;
    return Stack(
      children: [
        InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(
                MovieDetailsScreen.routeName,
                arguments: movie,
            );
          },
            child: MovieBackDrop(backdropPath: movie.backdropPath ?? '' ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Padding(
            padding:  const EdgeInsetsDirectional.only(
                start: 15,
              bottom: 15
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(
                        MovieDetailsScreen.routeName,
                        arguments: movie,
                    );
                  },
                    child: MoviePoster(poster: movie.posterPath ?? ''),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 8,
                      top: screenHeight *0.27 +5
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth*0.5,
                        child: Text(
                          movie.title ?? '',
                          style: Theme.of(context).textTheme.titleSmall,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Text(
                        '${movie.releaseDate?.substring(0, 4)} $adult ' ,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
