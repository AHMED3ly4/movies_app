class Movie {
  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  late final bool adult;
  late final String backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final double voteAverage;
  late final int voteCount;

  Movie.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;
    _data['genre_ids'] = genreIds;
    _data['id'] = id;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['poster_path'] = posterPath;
    _data['release_date'] = releaseDate;
    _data['title'] = title;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }
}