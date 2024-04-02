import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/indicators/error_indicator.dart';
import 'package:movies_app/shared/indicators/loading_endicator.dart';
import 'package:movies_app/tabs/home_tab/populer/view/widgets/popular_slider.dart';
import 'package:movies_app/tabs/home_tab/populer/view_model/popular_states.dart';
import 'package:movies_app/tabs/home_tab/populer/view_model/popular_view_model.dart';
class PopularView extends StatefulWidget {
  const PopularView({super.key});

  @override
  State<PopularView> createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  final viewModel =PopularViewModel();
@override
  void initState() {
    super.initState();
    viewModel.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create:(context) =>  viewModel,
      child: BlocBuilder<PopularViewModel,PopularStates>(
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
