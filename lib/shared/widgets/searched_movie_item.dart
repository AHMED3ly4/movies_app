import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/data/firebase_utils.dart';
import 'package:movies_app/shared/providers/watchlist_provider.dart';
import 'package:provider/provider.dart';
import '../data/movie.dart';
import '../indicators/loading_indicator.dart';
import '../screens/movie_details_screen/view/movie_details_screen.dart';

class SearchedMovieItem extends StatelessWidget {
  final Movie movie;
  const SearchedMovieItem({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    bool isWatchList =Provider.of<WatchlistProvider>(context).isWatchlist(movie.id!);

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
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Row(
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
            ),
            const SizedBox(height: 15,),
            Container(
              color: AppTheme.lightGreyColor,
              width: double.infinity,
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
