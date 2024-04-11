import 'package:flutter/material.dart';
import 'package:movies_app/tabs/browse_tab/data/models/category.dart';
import 'package:movies_app/tabs/browse_tab/view/screens/category_movies_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(CategoryMoviesScreen.routeName,
        arguments: category
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/categories_image.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Text(
            category.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
