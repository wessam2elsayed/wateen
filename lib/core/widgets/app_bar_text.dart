import 'package:flutter/material.dart';
import 'package:wateen/core/theme/app_colors.dart';


class AppBarText extends StatelessWidget {
  final String txt;
  const AppBarText({
    super.key, 
    required this.txt});

  @override
  Widget build(BuildContext context) {
    return Text(txt,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold
            ),       
      );
  }
}