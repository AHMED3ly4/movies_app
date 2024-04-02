
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/tabs/home_tab/populer/data/repository/popular_repository.dart';
import 'package:movies_app/tabs/home_tab/populer/view_model/popular_states.dart';

import '../../../../shared/data/movie.dart';

class PopularViewModel extends Cubit<PopularStates>{
  PopularViewModel() : super(PopularInitial());
  final repository =PopularRepository();

  Future<void> getPopularMovies() async{
    emit(GetPopularMoviesLoading());
    try{
      final movies = await repository.getPopularMovies();
      emit(GetPopularMoviesSuccess(movies));
    }catch(error){
      emit(GetPopularMoviesError(error.toString()));
    }
  }


}