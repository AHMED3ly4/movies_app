import 'package:movies_app/shared/data/movie.dart';

abstract class HomeTabStates{}

class HomeTabInitial extends HomeTabStates{}

class GetPopularMoviesLoading extends HomeTabStates{}

class GetPopularMoviesSuccess extends HomeTabStates{
  final List<Movie> movies;

  GetPopularMoviesSuccess(this.movies);

}

class GetPopularMoviesError extends HomeTabStates{
  final String errorMessage;

  GetPopularMoviesError(this.errorMessage);

}

class GetNewReleasedMoviesLoading extends HomeTabStates{}

class GetNewReleasedMoviesSuccess extends HomeTabStates{
  final List<Movie> movies;

  GetNewReleasedMoviesSuccess(this.movies);

}

class GetNewReleasedMoviesError extends HomeTabStates{
  final String errorMessage;

  GetNewReleasedMoviesError(this.errorMessage);

}

class GetRecommendedMoviesLoading extends HomeTabStates{}

class GetRecommendedMoviesSuccess extends HomeTabStates{
  final List<Movie> movies;

  GetRecommendedMoviesSuccess(this.movies);

}

class GetRecommendedMoviesError extends HomeTabStates{
  final String errorMessage;

  GetRecommendedMoviesError(this.errorMessage);

}