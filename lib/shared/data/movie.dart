class Movie {
  Movie({
    required this.adult,
     this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
     this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  late final bool? adult;
  late final String? backdropPath;
  late final List<int>? genreIds;
  late final int? id;
  late final String? originalLanguage;
  late final String? originalTitle;
  late final String? overview;
  late final double? popularity;
  late final String? posterPath;
  late final String? releaseDate;
  late final String? title;
  late final bool? video;
  late final double? voteAverage;
  late final int? voteCount;

  Movie.fromJson(Map<String, dynamic>? json){
    adult = json?['adult'];
    backdropPath = json?['backdrop_path'];
    genreIds = List.castFrom<dynamic, int>(json?['genre_ids']);
    id = json?['id'];
    originalLanguage = json?['original_language'];
    originalTitle = json?['original_title'];
    overview = json?['overview'];
    popularity = json?['popularity'];
    posterPath = json?['poster_path'];
    releaseDate = json?['release_date'];
    title = json?['title'];
    video = json?['video'];
    voteAverage = json?['vote_average'];
    voteCount = json?['vote_count'];
  }


}