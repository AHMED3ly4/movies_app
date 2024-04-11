import 'package:flutter/material.dart';
import 'package:movies_app/tabs/browse_tab/data/models/category.dart';
import 'package:movies_app/tabs/browse_tab/view/widgets/category_item.dart';

class CategoriesList extends StatelessWidget {
  final List<Category> categories;
  const CategoriesList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              childAspectRatio: 1.3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) => CategoryItem(category: categories[index]),
        ),
      ),
    );
  }
}
