import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/shared/data/movie.dart';
import 'package:movies_app/tabs/home_tab/data/data_source/home_tab_api_constants.dart';
import 'package:movies_app/tabs/home_tab/data/data_source/home_tab_data_source.dart';
import 'package:movies_app/tabs/home_tab/data/models/new_released_response.dart';
import 'package:movies_app/tabs/home_tab/data/models/recommended_response.dart';

import '../models/popular_response.dart';


class HomeTabApiDataSource extends HomeTabDataSource{

 @override
  Future<List<Movie>> getPopularMovies()async{
   final uri = Uri.https(
     HomeTabAPIConstants.baseURL,
     HomeTabAPIConstants.popularEndPoint,
   );
   final response =await http.get(
       uri,
       headers: {
         'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOWU4YzI2YjNjMWE1NmQyMjNlNmVlNzYwMmQ2NmMwNiIsInN1YiI6IjY2MGFiOGY0OWM5N2JkMDE3Y2EzYjUyYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xxcKOkWbvZLeylfXGVHafYSeeOchpUT1QiFuptZ2jnk',
       }
   );

   final json = jsonDecode(response.body);
   final popularResponse = PopularResponse.fromJson(json);
   return popularResponse.movies;

}

  @override
  Future<List<Movie>> getNewReleasedMovies({required int page ,required String language })async{
   final uri = Uri.https(
     HomeTabAPIConstants.baseURL,
     HomeTabAPIConstants.newReleasedEndPoint,
     {
       'page':page.toString(),
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
   final newReleasedResponse = NewReleasedResponse.fromJson(json);
   return newReleasedResponse.movies;

}


 @override
  Future<List<Movie>> getRecommendedMovies({required int page ,required String language })async{
   final uri = Uri.https(
       HomeTabAPIConstants.baseURL,
       HomeTabAPIConstants.recommendedEndPoint,
       {
         'page':page.toString(),
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
   final recommendedResponse = RecommendedResponse.fromJson(json);
   return recommendedResponse.movies;
 }


}