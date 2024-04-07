import 'package:movies_app/screens/movie_details_screen/data/models/movie_details.dart';

import '../../../../shared/data/movie.dart';

abstract class MovieDetailsDataSource{
  Future <MovieDetails>getMovieDetails({required String movieID,required String language });
  Future <List<Movie>?>getMoreLikeThis({required String movieID,required String language,required int page });
}