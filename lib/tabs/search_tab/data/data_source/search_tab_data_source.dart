import '../../../../shared/data/movie.dart';

abstract class SearchTabDataSource{
  Future<List<Movie>> getSearchResult(String query,{String language = "language",int page =1});
}