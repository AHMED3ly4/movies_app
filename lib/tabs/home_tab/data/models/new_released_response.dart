
import 'package:movies_app/shared/data/movie.dart';

class NewReleasedResponse {
  NewReleasedResponse({
    required this.dates,
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });
  late final Dates dates;
  late final int page;
  late final List<Movie> movies;
  late final int totalPages;
  late final int totalResults;

  NewReleasedResponse.fromJson(Map<String, dynamic> json){
    dates = Dates.fromJson(json['dates']);
    page = json['page'];
    movies = List.from(json['results']).map((e)=>Movie.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }


}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });
  late final String maximum;
  late final String minimum;

  Dates.fromJson(Map<String, dynamic> json){
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['maximum'] = maximum;
    _data['minimum'] = minimum;
    return _data;
  }
}