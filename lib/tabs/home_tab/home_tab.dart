import 'package:flutter/material.dart';
import 'package:movies_app/tabs/home_tab/populer/view/popular_view.dart';


class HomeTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        PopularView(),
      ],
    );
  }
}
