import '../../../../../shared/data/movie.dart';

abstract class PopularDataSource{
  Future<List<Movie>> getPopularMovies();
}