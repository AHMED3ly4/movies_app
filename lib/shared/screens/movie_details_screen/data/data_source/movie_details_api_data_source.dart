import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/shared/data/movie.dart';
import 'package:movies_app/shared/screens/movie_details_screen/data/data_source/movie_details_api_constants.dart';
import 'package:movies_app/shared/screens/movie_details_screen/data/data_source/movie_details_data_source.dart';
import 'package:movies_app/shared/screens/movie_details_screen/data/models/more_like_this_response.dart';

import '../models/movie_details.dart';

class MovieDetailsApiDataSource extends MovieDetailsDataSource{


  @override
  Future <MovieDetails>getMovieDetails({required String movieID,required String language }) async{
    final uri = Uri.https(
        MovieDetailsAPIConstants.baseURL,
        "${MovieDetailsAPIConstants.movieDetailsEndPoint}$movieID",
        {
          'language':language
        }
    );
    final response =await http.get(
        uri,
        headers: {
          'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOWU4YzI2YjNjMWE1NmQyMjNlNmVlNzYwMmQ2NmMwNiIsInN1YiI6IjY2MGFiOGY0OWM5N2JkMDE3Y2EzYjUyYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xxcKOkWbvZLeylfXGVHafYSeeOchpUT1QiFuptZ2jnk',
        }
    );
    final json = jsonDecode(response.body);
    return MovieDetails.fromJson(json);
  }

  @override
  Future <List<Movie>?>getMoreLikeThis({required String movieID,required String language,required int page }) async{
    final uri = Uri.https(
        MovieDetailsAPIConstants.baseURL,
        "${MovieDetailsAPIConstants.moreLikeThisEndPoint}$movieID/similar",
        {
          'language':language,
          'page':page.toString(),
        }
    );
    final response =await http.get(
        uri,
        headers: {
          'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOWU4YzI2YjNjMWE1NmQyMjNlNmVlNzYwMmQ2NmMwNiIsInN1YiI6IjY2MGFiOGY0OWM5N2JkMDE3Y2EzYjUyYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xxcKOkWbvZLeylfXGVHafYSeeOchpUT1QiFuptZ2jnk',
        }
    );
    final json = jsonDecode(response.body);
    final moreLikeThisResponse = MoreLikeThisResponse.fromJson(json);

    return moreLikeThisResponse.movies;

  }



}