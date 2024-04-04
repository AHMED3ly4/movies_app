import 'package:flutter/material.dart';
import 'package:movies_app/shared/data/movie.dart';

class PopularMovieItem extends StatelessWidget {
  final Movie movie;
  const PopularMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    final adult = movie.adult ? '+18':'';
    final screenHeight =MediaQuery.of(context).size.height;
    final screenWidth =MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/original${movie.backdropPath}',
                  fit: BoxFit.fill,
                  width: double.infinity-8,
                ),
                IconButton(
                    onPressed: (){},
                    icon: const Icon(
                        Icons.play_circle,
                      size: 60,
                    ),
                ),
              ],
            ),
          ],
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
                Stack(
                  children: [
                    Image.network(
                      height: screenHeight * 0.24,
                      width: screenWidth *0.4,
                      'https://image.tmdb.org/t/p/original${movie.posterPath}',
                      fit: BoxFit.fill,
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.bookmark_add,
                          size: 40,
                        ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 8,
                      top: screenHeight *0.3 +5
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth*0.5,
                        child: Text(
                          movie.title,
                          style: Theme.of(context).textTheme.titleSmall,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Text(
                        '${movie.releaseDate.substring(0, 4)} $adult ' ,
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
