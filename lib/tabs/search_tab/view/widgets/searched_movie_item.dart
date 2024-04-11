import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/movie_details_screen/data/models/movie_details.dart';
import 'package:movies_app/screens/movie_details_screen/view/movie_details_screen.dart';

import '../../../../shared/data/movie.dart';
import '../../../../shared/indicators/loading_indicator.dart';

class SearchedMovieItem extends StatelessWidget {
  final Movie movie;
  const SearchedMovieItem({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenHeight =MediaQuery.of(context).size.height;
    final screenWidth =MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(
          MovieDetailsScreen.routeName,
          arguments: movie,
        );
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            movie.backdropPath!='' && movie.backdropPath != null ?CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/original${movie.backdropPath}' ,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
              const LoadingIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: screenHeight *0.1,
              width: screenWidth *0.37,
              fit: BoxFit.fill,
            ) : SizedBox(
              height: screenHeight *0.1,
              width: screenWidth *0.37,
              child: const Icon(Icons.error),
            ),
            const SizedBox(width: 8,),
            SizedBox(
              width: screenWidth * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 18
                    ),
                  ),
                  movie.releaseDate !='' && movie.releaseDate != null ? Text(
                    movie.releaseDate!.substring(0,4) ,
                    style: Theme.of(context).textTheme.bodySmall,
                  ):const SizedBox(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
