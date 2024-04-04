import 'package:flutter/material.dart';
import 'package:movies_app/tabs/home_tab/view/sections/new_released_section.dart';
import 'package:movies_app/tabs/home_tab/view/sections/popular_section.dart';


class HomeTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        PopularSection(),
        NewReleasedSection(),
      ],
    );
  }
}
