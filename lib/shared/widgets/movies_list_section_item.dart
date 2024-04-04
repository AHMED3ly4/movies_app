import 'package:flutter/material.dart';

import '../data/movie.dart';

class MoviesListSectionItem extends StatelessWidget {
  final Movie movie;
  const MoviesListSectionItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenHeight =MediaQuery.of(context).size.height;
    final screenWidth =MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 5
      ),
      child: Stack(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/original${movie.posterPath}',
            width: screenWidth *0.35,
            fit: BoxFit.fill,
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.bookmark_add,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
