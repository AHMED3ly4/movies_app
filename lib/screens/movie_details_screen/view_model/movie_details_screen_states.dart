import 'package:movies_app/screens/movie_details_screen/data/models/movie_details.dart';
import 'package:movies_app/shared/data/movie.dart';

abstract class MovieDetailsScreenStates{}

class MovieDetailsScreenInitial extends MovieDetailsScreenStates{}

class GetMovieDetailsLoading extends MovieDetailsScreenStates{}

class GetMovieDetailsSuccess extends MovieDetailsScreenStates{
  final MovieDetails movieDetails;
  GetMovieDetailsSuccess(this.movieDetails);

}

class GetMovieDetailsError extends MovieDetailsScreenStates{
  final String errorMessage;

  GetMovieDetailsError(this.errorMessage);
}

class GetMoreLikeThisLoading extends MovieDetailsScreenStates{}

class GetMoreLikeThisSuccess extends MovieDetailsScreenStates{
  final List<Movie> movies ;
  GetMoreLikeThisSuccess(this.movies);

}

class GetMoreLikeThisError extends MovieDetailsScreenStates{
  final String errorMessage;

  GetMoreLikeThisError(this.errorMessage);
}
