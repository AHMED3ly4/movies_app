import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/screens/movie_details_screen/data/repository/movie_details_screen_repository.dart';
import 'package:movies_app/shared/screens/movie_details_screen/view_model/movie_details_screen_states.dart';

class MovieDetailsScreenViewModel extends Cubit<MovieDetailsScreenStates>{
  MovieDetailsScreenViewModel() : super(MovieDetailsScreenInitial());
  final repository = MovieDetailsScreenRepository();

  Future<void> getMovieDetails({required String movieID}) async{
    emit(GetMovieDetailsLoading());
    try{
      final movieDetails = await repository.getMovieDetails(movieID: movieID);
      emit(GetMovieDetailsSuccess(movieDetails));
    }catch(error){
      emit(GetMovieDetailsError(error.toString()));
    }
  }

  Future<void> getMoreLikeThis({required String movieID}) async{
    emit(GetMoreLikeThisLoading());
    try{
      final movies = await repository.getMoreLikeThis(movieID: movieID);

      emit(GetMoreLikeThisSuccess(movies!)) ;
    }catch(error){
      emit(GetMoreLikeThisError(error.toString()));
    }
  }

}