import 'package:movies_app/shared/sources_locator.dart';
import '../../../../../shared/data/movie.dart';

class HomeTabRepository{
  final popularDataSource = SourcesLocator.popularSource;

  Future<List<Movie>> getPopularMovies() async{
    return popularDataSource.getPopularMovies();
  }
  Future<List<Movie>> getNewReleasedMovies({int page=1, String language="en-US"}) async{
    return popularDataSource.getNewReleasedMovies(page: page,language: language);
  }
}