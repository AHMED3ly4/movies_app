import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/indicators/error_indicator.dart';
import 'package:movies_app/shared/indicators/loading_indicator.dart';
import 'package:movies_app/tabs/browse_tab/view/screens/category_movies_screen.dart';
import 'package:movies_app/tabs/home_tab/view/widgets/movie_back_drop.dart';
import '../../../../../tabs/home_tab/view/widgets/movie_poster.dart';
import '../../../../app_theme.dart';
import '../../view_model/movie_details_screen_states.dart';
import '../../view_model/movie_details_screen_view_model.dart';

class MovieDetailsSection extends StatefulWidget {
  final String movieID;
  const MovieDetailsSection({super.key, required this.movieID});

  @override
  State<MovieDetailsSection> createState() => _MovieDetailsSectionState();
}

class _MovieDetailsSectionState extends State<MovieDetailsSection> {
  final viewModel =MovieDetailsScreenViewModel();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getMovieDetails(movieID: widget.movieID);
  }


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (context) => viewModel,
      child: BlocBuilder<MovieDetailsScreenViewModel,MovieDetailsScreenStates>(
          builder: (context, state) {
            if(state is GetMovieDetailsError){
              return ErrorIndicator(errorMessage: state.errorMessage,);
            }else if(state is GetMovieDetailsLoading){
              return const LoadingIndicator();
            } else if(state is GetMovieDetailsSuccess){
              final movie = state.movieDetails;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieBackDrop(
                    backdropPath: movie.backdropPath ?? '',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title ?? '',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4,),
                        Text(
                          '${movie.releaseDate?.substring(0,4)} R 1h 59m',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 18,),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MoviePoster(poster: movie.posterPath ?? ''),
                              const SizedBox(width: 8,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *0.5,
                                    height: 30,
                                    child: ListView.builder(
                                      itemCount: movie.genres?.length ?? 0,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => Container(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 4,
                                          horizontal: 10,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 4,
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                            ),
                                            borderRadius: BorderRadius.circular(4)
                                        ),
                                        child: Text(
                                          movie.genres?[index].name ?? '',
                                          style: Theme.of(context).textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.5,
                                    child: Text(
                                      movie.overview ?? '',
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,color: AppTheme.goldColor,size: 25,),
                                      const SizedBox(width: 8,),
                                      Text(
                                        movie.voteAverage?.toStringAsFixed(1) ?? '',
                                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                            fontSize: 18
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              );
            }else{
              return const Text('wait');
            }
          },
      ),
    );
  }
}
