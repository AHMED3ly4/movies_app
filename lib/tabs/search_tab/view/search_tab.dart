import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/tabs/search_tab/view/searched_movies_list.dart';
import 'package:movies_app/tabs/search_tab/view_model/search_tab_view_model.dart';
import 'package:provider/provider.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});


  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SearchTabViewModel(),
      builder: (context, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) async{
                Provider.of<SearchTabViewModel>(context,listen: false).changeMovies(value);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: AppTheme.lightGreyColor,
                  hintText: 'Search'
              ),
            ),
             const Expanded(child: SearchedMovieList()),
          ],
        ),
      ),

    );
  }
}
