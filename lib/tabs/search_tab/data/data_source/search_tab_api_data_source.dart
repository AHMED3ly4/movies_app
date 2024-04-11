import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/shared/data/movie.dart';
import 'package:movies_app/tabs/search_tab/data/data_source/search_tab_data_source.dart';
import 'package:movies_app/tabs/search_tab/data/models/search_result.dart';

class SearchTabAPIDataSource extends SearchTabDataSource{

  @override
  Future<List<Movie>> getSearchResult(String query,{String language = "language",int page =1})async{
    final uri = Uri.https(
        "api.themoviedb.org",
        "3/search/movie",
        {
          "query":query,
          "include_adult" :"false",
          "language" : language,
          "page" : page.toString(),
        }
    );
    final response = await http.get(
        uri,
        headers: {
          'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOWU4YzI2YjNjMWE1NmQyMjNlNmVlNzYwMmQ2NmMwNiIsInN1YiI6IjY2MGFiOGY0OWM5N2JkMDE3Y2EzYjUyYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xxcKOkWbvZLeylfXGVHafYSeeOchpUT1QiFuptZ2jnk',

        }
    );
    final json = jsonDecode(response.body);
    final searchResult= SearchResult.fromJson(json);
    return searchResult.movies;
  }

}