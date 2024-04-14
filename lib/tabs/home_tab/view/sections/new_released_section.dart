import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/widgets/movies_list_section.dart';
import 'package:movies_app/tabs/home_tab/view_model/home_tab_view_model.dart';
import 'package:movies_app/tabs/home_tab/view_model/home_tab_states.dart';

import '../../../../shared/indicators/error_indicator.dart';
import '../../../../shared/indicators/loading_indicator.dart';
import '../widgets/popular_slider.dart';

class NewReleasedSection extends StatefulWidget {
  const NewReleasedSection({super.key});

  @override
  State<NewReleasedSection> createState() => _NewReleasedSectionState();
}
class _NewReleasedSectionState extends State<NewReleasedSection> {
  final viewModel =HomeTabViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewReleasedMovies();
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight =MediaQuery.of(context).size.height;
    final screenWidth =MediaQuery.of(context).size.width;
    return BlocProvider(
        create: (context) => viewModel,
      child: BlocBuilder<HomeTabViewModel,HomeTabStates>(
          builder: (context, state) {
            if(state is GetNewReleasedMoviesError){
              return ErrorIndicator(errorMessage: state.errorMessage,);
            }else if(state is GetNewReleasedMoviesLoading){
              return const LoadingIndicator();
            } else if(state is GetNewReleasedMoviesSuccess){
              final movies = state.movies;
              return MoviesListSection('New Released', movies);
            }else{
              return const Text('wait');
            }
          },
      ),
    );
  }
}
