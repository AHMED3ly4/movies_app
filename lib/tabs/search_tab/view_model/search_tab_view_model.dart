import 'package:flutter/cupertino.dart';
import 'package:movies_app/tabs/search_tab/data/repository/search_tab_repository.dart';

import '../../../shared/data/movie.dart';

class SearchTabViewModel with ChangeNotifier{
  final repo = SearchTabRepository();
  List<Movie> movies = [];

  Future<void> changeMovies(String query)async{
    try{
      movies = await repo.getSearchResult(query);
      notifyListeners();
    }catch(error){
      print(error);
    }
  }

}