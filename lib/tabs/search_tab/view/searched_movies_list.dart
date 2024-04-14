import 'package:flutter/material.dart';
import 'package:movies_app/shared/widgets/searched_movie_item.dart';
import 'package:movies_app/tabs/search_tab/view_model/search_tab_view_model.dart';
import 'package:provider/provider.dart';


class SearchedMovieList extends StatefulWidget {

  const SearchedMovieList({super.key});

  @override
  State<SearchedMovieList> createState() => _SearchedMovieListState();
}

class _SearchedMovieListState extends State<SearchedMovieList> {
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<SearchTabViewModel>(context);
    return ListView.builder(
      itemCount: provider.movies.length,
      itemBuilder: (context, index) {
        return SearchedMovieItem(movie: provider.movies[index]);
      },
    );
  }
}
