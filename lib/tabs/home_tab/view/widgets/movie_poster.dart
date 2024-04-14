import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/shared/data/movie.dart';
import 'package:provider/provider.dart';

import '../../../../shared/data/firebase_utils.dart';
import '../../../../shared/indicators/loading_indicator.dart';
import '../../../../shared/providers/watchlist_provider.dart';

class MoviePoster extends StatelessWidget {
  final Movie movie;
  const MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenHeight =MediaQuery.of(context).size.height;
    final screenWidth =MediaQuery.of(context).size.width;
    bool isWatchList =Provider.of<WatchlistProvider>(context).isWatchlist(movie.id!);

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/original${movie.posterPath}',
          placeholder: (context, url) => const LoadingIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          height: screenHeight * 0.24,
          width: screenWidth *0.4,
          fit: BoxFit.fill,
        ),
        isWatchList ?
        InkWell(
          onTap: () async {
            FirebaseUtils.deleteMovieFromWatchList(movie.id!).timeout(
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
            FirebaseUtils.addMovieToWatchList(movie).timeout(
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
    );
  }
}
