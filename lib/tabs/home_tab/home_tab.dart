import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/tabs/home_tab/populer/data/data_source/popular_api_data_source.dart';
import 'package:movies_app/tabs/home_tab/populer/view/popular_view.dart';

import '../../shared/app_theme.dart';

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
