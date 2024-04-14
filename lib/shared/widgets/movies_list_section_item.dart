import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/shared/data/firebase_utils.dart';
import 'package:movies_app/shared/indicators/loading_indicator.dart';
import 'package:movies_app/shared/providers/watchlist_provider.dart';
import 'package:provider/provider.dart';
import '../app_theme.dart';
import '../data/movie.dart';
import '../screens/movie_details_screen/view/movie_details_screen.dart';

class MoviesListSectionItem extends StatefulWidget {
  final Movie movie;
  final bool hasBottomDescription;
  const MoviesListSectionItem(
      {super.key, required this.movie, required this.hasBottomDescription});

  @override
  State<MoviesListSectionItem> createState() => _MoviesListSectionItemState();
}

class _MoviesListSectionItemState extends State<MoviesListSectionItem> {



  @override
  Widget build(BuildContext context) {
    bool isWatchList =Provider.of<WatchlistProvider>(context).isWatchlist(widget.movie.id!);
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
                        arguments: widget.movie,
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original${widget.movie.posterPath}',
                      placeholder: (context, url) => const LoadingIndicator(),
                      errorWidget: (context, url, error) =>
                          const Center(child:  Icon(Icons.error)),
                      width: screenWidth * 0.3,
                      fit: BoxFit.fill,
                    ),
                  ),
                  isWatchList ?
                  InkWell(
                    onTap: () async {
                      FirebaseUtils.deleteMovieFromWatchList(widget.movie.id!).timeout(
                        const Duration(milliseconds: 100),
                        onTimeout: (){
                          Provider.of<WatchlistProvider>(context,listen: false).getWatchListMovies();
                        }
                      ).catchError((e){
                        Fluttertoast.showToast(
                            msg: e.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      });

                    },
                    child: Image.asset(
                      'assets/images/bookmark_done.png',
                    ),
                  ) :
                  InkWell(
                    onTap: () async {
                      FirebaseUtils.addMovieToWatchList(widget.movie).timeout(
                          const Duration(milliseconds: 100),
                          onTimeout: (){
                            Provider.of<WatchlistProvider>(context,listen: false).getWatchListMovies();
                          }
                      ).catchError((e){
                        Fluttertoast.showToast(
                            msg: e.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      });
                    },
                    child: Image.asset(
                      'assets/images/bookmark.png',
                    ),
                  ),
                ],
              ),
            ),
            if (widget.hasBottomDescription)
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
                          widget.movie.voteAverage?.toStringAsFixed(1) ?? 'not Known',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    Text(
                      widget.movie.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 12),
                    ),
                    widget.movie.releaseDate !='' && widget.movie.releaseDate != null ? Text(
                      '${widget.movie.releaseDate?.substring(0, 4)} R 1h 59m',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ) : const SizedBox(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
