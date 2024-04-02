import 'package:movies_app/shared/data/movie.dart';

abstract class PopularStates{}

class PopularInitial extends PopularStates{}

class GetPopularMoviesLoading extends PopularStates{}

class GetPopularMoviesSuccess extends PopularStates{
  final List<Movie> movies;

  GetPopularMoviesSuccess(this.movies);

}

class GetPopularMoviesError extends PopularStates{
  final String errorMessage;

  GetPopularMoviesError(this.errorMessage);

}