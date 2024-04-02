import 'package:movies_app/shared/sources_locator.dart';
import '../../../../../shared/data/movie.dart';

class PopularRepository{
  final popularDataSource = SourcesLocator.popularSource;

  Future<List<Movie>> getPopularMovies() async{
    return popularDataSource.getPopularMovies();
  }
}