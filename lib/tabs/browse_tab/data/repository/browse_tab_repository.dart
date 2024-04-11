import 'package:movies_app/shared/sources_locator.dart';
import 'package:movies_app/tabs/browse_tab/data/data_source/browse_data_source.dart';
import 'package:movies_app/tabs/browse_tab/data/models/category.dart';

import '../../../../shared/data/movie.dart';

class BrowseTabRepository{
  final BrowseDataSource browseDataSource =SourcesLocator.categoriesSource;

  Future<List<Category>> getCategories() async{
    return browseDataSource.getCategories();
  }
  Future<List<Movie>> searchCategoryMovies(int categoryGenre, {int page =1})async{
    return browseDataSource.searchCategoryMovies(categoryGenre);
  }
}