import 'package:movies_app/shared/data/movie.dart';

class SearchResult {
  SearchResult({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });
  late final int page;
  late final List<Movie> movies;
  late final int totalPages;
  late final int totalResults;

  SearchResult.fromJson(Map<String, dynamic> json){
    page = json['page'];
    movies = List.from(json['results']).map((e)=>Movie.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

}