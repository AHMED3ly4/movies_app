import '../../../../../shared/data/movie.dart';

class PopularResponse {
  PopularResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  late final int page;
  late final List<Movie> results;
  late final int totalPages;
  late final int totalResults;

  PopularResponse.fromJson(Map<String, dynamic> json){
    page = json['page'];
    results = List.from(json['results']).map((e)=>Movie.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page'] = page;
    _data['results'] = results.map((e)=>e.toJson()).toList();
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }
}

