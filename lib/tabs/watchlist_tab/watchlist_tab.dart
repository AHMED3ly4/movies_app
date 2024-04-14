import 'package:flutter/material.dart';
import 'package:movies_app/shared/providers/watchlist_provider.dart';
import 'package:provider/provider.dart';

import '../../shared/widgets/searched_movie_item.dart';

class WatchlistTab extends StatefulWidget {
  const WatchlistTab({super.key});


  @override
  State<WatchlistTab> createState() => _WatchlistTabState();
}

class _WatchlistTabState extends State<WatchlistTab> {

  @override
  Widget build(BuildContext context) {
    final watchListMovies =Provider.of<WatchlistProvider>(context).watchListMovies;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15,),
          Text(
            'Browse categories',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 24
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: watchListMovies.length,
              itemBuilder: (context, index) {
                return SearchedMovieItem(movie: watchListMovies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
