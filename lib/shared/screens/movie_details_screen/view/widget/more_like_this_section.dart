import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/screens/movie_details_screen/view_model/movie_details_screen_states.dart';
import 'package:movies_app/shared/screens/movie_details_screen/view_model/movie_details_screen_view_model.dart';
import 'package:movies_app/shared/widgets/movies_list_section.dart';
import '../../../../indicators/error_indicator.dart';
import '../../../../indicators/loading_indicator.dart';

class MoreLikeThisSection extends StatefulWidget {
  final String movieID;
  const MoreLikeThisSection({super.key, required this.movieID});

  @override
  State<MoreLikeThisSection> createState() => _MoreLikeThisSectionState();
}

class _MoreLikeThisSectionState extends State<MoreLikeThisSection> {
  final viewModel = MovieDetailsScreenViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getMoreLikeThis(movieID: widget.movieID);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => viewModel,
      child: BlocBuilder<MovieDetailsScreenViewModel,MovieDetailsScreenStates>(
          builder: (context, state) {
            if(state is GetMoreLikeThisError){
              return ErrorIndicator(errorMessage: state.errorMessage,);
            }else if(state is GetMoreLikeThisLoading){
              return const LoadingIndicator();
            } else if(state is GetMoreLikeThisSuccess){
              final movies = state.movies;
              print(movies.length);
              return MoviesListSection(
                "More Like This",
                movies,
                hasBottomDescription: true,
              );
            }else{
              return const Text('wait');
            }
          },
      ),
    );
  }
}

