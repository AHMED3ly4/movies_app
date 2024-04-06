import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../shared/indicators/loading_indicator.dart';

class MoviePoster extends StatelessWidget {
  final String poster;
  const MoviePoster({super.key, required this.poster});

  @override
  Widget build(BuildContext context) {
    final screenHeight =MediaQuery.of(context).size.height;
    final screenWidth =MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/original$poster',
          placeholder: (context, url) => const LoadingIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          height: screenHeight * 0.24,
          width: screenWidth *0.4,
          fit: BoxFit.fill,
        ),
        InkWell(
          onTap: (){},
          child: Image.asset('assets/images/bookmark.png',),
        ),
      ],
    );
  }
}
