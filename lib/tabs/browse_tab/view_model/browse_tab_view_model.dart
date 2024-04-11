
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/tabs/browse_tab/data/repository/browse_tab_repository.dart';
import 'package:movies_app/tabs/browse_tab/view_model/browse_tab_states.dart';

class BrowseTabViewModel extends Cubit<BrowseTabStates>{
  BrowseTabViewModel() : super(BrowseTabInitial());
  final repo = BrowseTabRepository();

  Future<void> getCategories() async{
    emit(GetCategoriesLoading());
    try{
      final categories = await repo.getCategories();
      emit(GetCategoriesSuccess(categories: categories));
    }catch(errorMessage){
      emit(GetCategoriesError(errorMessage: errorMessage.toString()));
    }
}

  Future<void> searchCategoryMovies(int categoryGenre, {int page =1}) async{
    emit(SearchCategoryMoviesLoading());
    try{
      final movies = await repo.searchCategoryMovies(categoryGenre);
      emit(SearchCategoryMoviesSuccess(movies: movies));
    }catch(errorMessage){
      emit(SearchCategoryMoviesError(errorMessage: errorMessage.toString()));
    }
}



}