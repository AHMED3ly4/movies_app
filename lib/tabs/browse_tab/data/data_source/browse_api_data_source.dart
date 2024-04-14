import 'dart:convert';

import 'package:movies_app/shared/data/movie.dart';
import 'package:movies_app/shared/data/search_result.dart';
import 'package:movies_app/tabs/browse_tab/data/data_source/browse_data_source.dart';
import 'package:movies_app/tabs/browse_tab/data/data_source/browse_tab_api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/tabs/browse_tab/data/models/category.dart';
import 'package:movies_app/tabs/browse_tab/data/models/category_response.dart';

class BrowseAPIDataSource extends BrowseDataSource{

  @override
  Future<List<Category>> getCategories() async{
    final uri =Uri.https(
      BrowseTabAPIConstants.baseURL,
      BrowseTabAPIConstants.getCategoriesEndPoint,
      {
        "language" : "en"
      }
    );
    final response = await http.get(
        uri,
     headers: {
    'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOWU4YzI2YjNjMWE1NmQyMjNlNmVlNzYwMmQ2NmMwNiIsInN1YiI6IjY2MGFiOGY0OWM5N2JkMDE3Y2EzYjUyYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xxcKOkWbvZLeylfXGVHafYSeeOchpUT1QiFuptZ2jnk',
    }
    );
    final json = jsonDecode(response.body);
    final categoryResponse = CategoriesResponse.fromJson(json);
    return categoryResponse.categories;
  }

  @override
  Future<List<Movie>> searchCategoryMovies(int categoryGenre, {int page =1}) async{
    final uri =Uri.https(
      BrowseTabAPIConstants.baseURL,
      BrowseTabAPIConstants.searchCategoryMoviesEndPoint,
      {
        "with_genres" : categoryGenre.toString(),
        "page":page.toString(),
      }
    );
    final response = await http.get(
        uri,
     headers: {
    'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOWU4YzI2YjNjMWE1NmQyMjNlNmVlNzYwMmQ2NmMwNiIsInN1YiI6IjY2MGFiOGY0OWM5N2JkMDE3Y2EzYjUyYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xxcKOkWbvZLeylfXGVHafYSeeOchpUT1QiFuptZ2jnk',
    }
    );
    final json = jsonDecode(response.body);
    final searchResult = SearchResult.fromJson(json);
    return searchResult.movies;
  }



}