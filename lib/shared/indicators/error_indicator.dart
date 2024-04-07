import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
   final String errorMessage;
   ErrorIndicator({this.errorMessage = 'Something went wrong'});


  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage));
  }
}
