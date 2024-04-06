import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../shared/indicators/loading_indicator.dart';

class MovieBackDrop extends StatelessWidget {
  final String backdropPath;
  const MovieBackDrop({super.key,required this.backdropPath});

  @override
  Widget build(BuildContext context) {
    final screenHeight =MediaQuery.of(context).size.height;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/original$backdropPath',
          progressIndicatorBuilder: (context, url, downloadProgress) =>
          const LoadingIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: double.infinity-8,
          height: screenHeight *0.27,
          fit: BoxFit.fill,
        ),
        const Icon(
          Icons.play_circle,
          size: 60,
        ),
      ],
    );
  }
}
