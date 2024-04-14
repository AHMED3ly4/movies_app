import 'package:movies_app/shared/screens/movie_details_screen/data/data_source/movie_details_data_source.dart';
import 'package:movies_app/shared/screens/movie_details_screen/data/models/movie_details.dart';
import 'package:movies_app/shared/sources_locator.dart';

import '../../../../data/movie.dart';

class MovieDetailsScreenRepository{
  final MovieDetailsDataSource movieDetailsDataSource = SourcesLocator.movieDetailsSource;

  Future<MovieDetails> getMovieDetails({required String movieID,String language = "en-US"}) async{
    return movieDetailsDataSource.getMovieDetails(movieID: movieID, language: language);
  }

  Future <List<Movie>?>getMoreLikeThis({required String movieID, String language= "en-US", int page =1 }) async{
    return movieDetailsDataSource.getMoreLikeThis(movieID: movieID, language: language, page: page);
  }
}