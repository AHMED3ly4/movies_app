import 'package:movies_app/shared/sources_locator.dart';

import '../../../../shared/data/movie.dart';

class SearchTabRepository{
  final searchTabDataSource =SourcesLocator.searchSource;

  Future<List<Movie>> getSearchResult(String query,{String language = "language",int page =1})async{

      return searchTabDataSource.getSearchResult(query);

  }
}