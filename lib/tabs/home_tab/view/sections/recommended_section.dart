import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/tabs/home_tab/view_model/home_tab_states.dart';
import 'package:movies_app/tabs/home_tab/view_model/home_tab_view_model.dart';

import '../../../../shared/indicators/error_indicator.dart';
import '../../../../shared/indicators/loading_indicator.dart';
import '../../../../shared/widgets/movies_list_section.dart';

class RecommendedSection extends StatefulWidget {
  const RecommendedSection({super.key});

  @override
  State<RecommendedSection> createState() => _RecommendedSectionState();
}

class _RecommendedSectionState extends State<RecommendedSection> {
  final viewModel = HomeTabViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getRecommendedMovies();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => viewModel,
      child: BlocBuilder<HomeTabViewModel,HomeTabStates>(
          builder: (context, state) {
            if(state is GetRecommendedMoviesError){
              return ErrorIndicator(errorMessage: state.errorMessage,);
            }else if(state is GetRecommendedMoviesLoading){
              return const LoadingIndicator();
            } else if(state is GetRecommendedMoviesSuccess){
              final movies = state.movies;
              return MoviesListSection('Recommended', movies,hasBottomDescription: true,);
            }else{
              return const Text('wait');
            }
          },
      ),
    );
  }
}
