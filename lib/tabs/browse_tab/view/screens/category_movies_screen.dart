import 'package:flutter/material.dart';

import 'package:movies_app/tabs/browse_tab/data/models/category.dart';
import 'package:movies_app/tabs/browse_tab/view/widgets/category_movies_list.dart';

class CategoryMoviesScreen extends StatelessWidget {
  static const routeName ='category movies screen';
  const CategoryMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.name
        ),
      ),
      body: CategoryMoviesList(category: category,),
    );
  }
}
