
import 'package:movies_app/tabs/browse_tab/data/models/category.dart';

import '../../../../shared/data/movie.dart';

abstract class BrowseDataSource{
  Future<List<Category>> getCategories();
  Future<List<Movie>> searchCategoryMovies(int categoryGenre, {int page =1});
}