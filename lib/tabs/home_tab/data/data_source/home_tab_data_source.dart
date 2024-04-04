import '../../../../../shared/data/movie.dart';

abstract class HomeTabDataSource{
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getNewReleasedMovies({required int page ,required String language });
}