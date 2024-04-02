import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/data/movie.dart';
import 'package:movies_app/tabs/home_tab/populer/data/data_source/popular_data_source.dart';
import 'package:movies_app/tabs/home_tab/populer/data/models/popular_response.dart';

class PopularApiDataSource extends PopularDataSource{

 @override
  Future<List<Movie>> getPopularMovies()async{
   final uri = Uri.https(
     'api.themoviedb.org',
     '/3/movie/popular',
   );
   final response =await http.get(
       uri,
       headers: {
         'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOWU4YzI2YjNjMWE1NmQyMjNlNmVlNzYwMmQ2NmMwNiIsInN1YiI6IjY2MGFiOGY0OWM5N2JkMDE3Y2EzYjUyYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xxcKOkWbvZLeylfXGVHafYSeeOchpUT1QiFuptZ2jnk',
       }
   );

   final json = jsonDecode(response.body);
   final popularResponse = PopularResponse.fromJson(json);
   return popularResponse.results;

}

}