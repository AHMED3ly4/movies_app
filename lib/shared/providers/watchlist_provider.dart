import 'package:flutter/material.dart';
import 'package:movies_app/shared/data/firebase_utils.dart';
import 'package:movies_app/shared/data/movie.dart';

class WatchlistProvider with ChangeNotifier{
  List<Movie> watchListMovies = [];

  void getWatchListMovies()async{
    watchListMovies = await FirebaseUtils.getWatchListMovies();
    notifyListeners();
  }

  bool isWatchlist (int movieId){
    for(int i = 0 ; i<watchListMovies.length ; i++){
      if(watchListMovies[i].id == movieId) {
        return true;
      }
    }
    return false;
  }

}