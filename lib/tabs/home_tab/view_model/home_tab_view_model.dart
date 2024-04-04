
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/tabs/home_tab/view_model/popular_states.dart';
import '../data/repository/home_tab_repository.dart';

class HomeTabViewModel extends Cubit<HomeTabStates>{
  HomeTabViewModel() : super(HomeTabInitial());
  final repository =HomeTabRepository();

  Future<void> getPopularMovies() async{
    emit(GetPopularMoviesLoading());
    try{
      final movies = await repository.getPopularMovies();
      emit(GetPopularMoviesSuccess(movies));
    }catch(error){
      emit(GetPopularMoviesError(error.toString()));
    }
  }
  
  Future<void> getNewReleasedMovies() async{
    emit(GetNewReleasedMoviesLoading());
    try{
      final movies = await repository.getPopularMovies();
      emit(GetPopularMoviesSuccess(movies));
    }catch(error){
      emit(GetNewReleasedMoviesError(error.toString()));
    }
  }

}