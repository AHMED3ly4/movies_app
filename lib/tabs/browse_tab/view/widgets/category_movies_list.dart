import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/widgets/searched_movie_item.dart';
import 'package:movies_app/tabs/browse_tab/data/models/category.dart';
import 'package:movies_app/tabs/browse_tab/view_model/browse_tab_states.dart';
import 'package:movies_app/tabs/browse_tab/view_model/browse_tab_view_model.dart';

import '../../../../shared/indicators/error_indicator.dart';
import '../../../../shared/indicators/loading_indicator.dart';

class CategoryMoviesList extends StatefulWidget {
  final Category category;
  const CategoryMoviesList({super.key, required this.category});

  @override
  State<CategoryMoviesList> createState() => _CategoryMoviesListState();
}

class _CategoryMoviesListState extends State<CategoryMoviesList> {
  final viewModel =BrowseTabViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.searchCategoryMovies(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => viewModel,
      child: BlocBuilder<BrowseTabViewModel,BrowseTabStates>(
          builder: (context, state) {
            if(state is SearchCategoryMoviesLoading){
              return const LoadingIndicator();
            }
            else if(state is SearchCategoryMoviesSuccess){
              return ListView.builder(
                itemCount: state.movies.length,
                  itemBuilder: (context, index) => SearchedMovieItem(movie: state.movies[index]),
              );
            }
            else if(state is SearchCategoryMoviesError){
              return ErrorIndicator(
                errorMessage: state.errorMessage,
              );
            }
            return const SizedBox();
          },
      ),
    );
  }
}
