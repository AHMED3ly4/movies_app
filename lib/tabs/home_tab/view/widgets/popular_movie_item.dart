import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/shared/data/movie.dart';

import '../../../../shared/indicators/loading_indicator.dart';

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
                CachedNetworkImage(
                  imageUrl: 'https://image.tmdb.org/t/p/original${movie.backdropPath}',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const LoadingIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: double.infinity-8,
                  height: screenHeight *0.27,
                  fit: BoxFit.fill,
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
                    CachedNetworkImage(
                      imageUrl: 'https://image.tmdb.org/t/p/original${movie.posterPath}',
                      placeholder: (context, url) => const LoadingIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      height: screenHeight * 0.24,
                      width: screenWidth *0.4,
                      fit: BoxFit.fill,
                    ),
                    InkWell(
                      onTap: (){},
                      child: Image.asset('assets/images/bookmark.png',),
                    ),
                  ],
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
