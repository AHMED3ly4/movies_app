
import 'package:movies_app/screens/movie_details_screen/data/data_source/movie_details_api_data_source.dart';
import 'package:movies_app/tabs/search_tab/data/data_source/search_tab_api_data_source.dart';

import '../tabs/home_tab/data/data_source/home_tab_api_data_source.dart';

class SourcesLocator{
  static final homeTabSource =HomeTabApiDataSource();
  static final movieDetailsSource =MovieDetailsApiDataSource();
  static final searchSource =SearchTabAPIDataSource();

}