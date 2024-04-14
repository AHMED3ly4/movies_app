import 'package:movies_app/shared/data/movie.dart';
import 'package:movies_app/tabs/browse_tab/data/models/category.dart';

abstract class BrowseTabStates{}

class BrowseTabInitial extends BrowseTabStates{}

class GetCategoriesLoading extends BrowseTabStates{}
class GetCategoriesSuccess extends BrowseTabStates{
  final List<Category> categories;
  GetCategoriesSuccess({required this.categories});
}
class GetCategoriesError extends BrowseTabStates{
  final String errorMessage;
  GetCategoriesError({required this.errorMessage});
}

class SearchCategoryMoviesLoading extends BrowseTabStates{}
class SearchCategoryMoviesSuccess extends BrowseTabStates{
  final List<Movie> movies;
  SearchCategoryMoviesSuccess({required this.movies});
}
class SearchCategoryMoviesError extends BrowseTabStates{
  final String errorMessage;
  SearchCategoryMoviesError({required this.errorMessage});
}