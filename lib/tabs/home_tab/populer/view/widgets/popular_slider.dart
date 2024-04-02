import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/shared/data/movie.dart';
import 'package:movies_app/tabs/home_tab/populer/view/widgets/popular_movie_item.dart';

class PopularSlider extends StatelessWidget {
   PopularSlider(this.movies);
  List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: movies.length,
        itemBuilder: (context, index, realIndex) =>PopularMovieItem(movies[index]),
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16/9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 6),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, reason) {},
          scrollDirection: Axis.horizontal,
        )
    );
  }
}
