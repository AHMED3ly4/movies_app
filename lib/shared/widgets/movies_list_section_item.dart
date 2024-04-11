import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/shared/indicators/loading_indicator.dart';
import '../../screens/movie_details_screen/view/movie_details_screen.dart';
import '../app_theme.dart';
import '../data/movie.dart';

class MoviesListSectionItem extends StatelessWidget {
  final Movie movie;
  final bool hasBottomDescription;
  const MoviesListSectionItem(
      {super.key, required this.movie, required this.hasBottomDescription});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        MovieDetailsScreen.routeName,
                        arguments: movie,
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original${movie.posterPath}',
                      placeholder: (context, url) => const LoadingIndicator(),
                      errorWidget: (context, url, error) =>
                          const Center(child:  Icon(Icons.error)),
                      width: screenWidth * 0.3,
                      fit: BoxFit.fill,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/bookmark.png',
                    ),
                  ),
                ],
              ),
            ),
            if (hasBottomDescription)
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppTheme.goldColor,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          movie.voteAverage?.toStringAsFixed(1) ?? 'not Known',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    Text(
                      movie.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 12),
                    ),
                    movie.releaseDate !='' && movie.releaseDate != null ? Text(
                      '${movie.releaseDate?.substring(0, 4)} R 1h 59m',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ) : SizedBox(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
