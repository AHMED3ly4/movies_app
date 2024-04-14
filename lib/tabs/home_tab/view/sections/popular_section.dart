import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/indicators/error_indicator.dart';
import 'package:movies_app/shared/indicators/loading_indicator.dart';
import 'package:movies_app/tabs/home_tab/view/widgets/popular_slider.dart';

import '../../view_model/home_tab_states.dart';
import '../../view_model/home_tab_view_model.dart';

class PopularSection extends StatefulWidget {
  const PopularSection({super.key});

  @override
  State<PopularSection> createState() => _PopularSectionState();
}

class _PopularSectionState extends State<PopularSection> {
  final viewModel =HomeTabViewModel();
@override
  void initState() {
    super.initState();
    viewModel.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create:(context) =>  viewModel,
      child: BlocBuilder<HomeTabViewModel,HomeTabStates>(
          builder: (context, state) {
            if(state is GetPopularMoviesError){
              return ErrorIndicator(errorMessage: state.errorMessage,);
            }else if(state is GetPopularMoviesLoading){
              return const LoadingIndicator();
            } else if(state is GetPopularMoviesSuccess){
              final movies = state.movies;
              return PopularSlider(movies);
            }else{
              return const Text('wait');
            }
          },
      ),
    );
  }
}
