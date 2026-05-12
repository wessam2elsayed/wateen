import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String txt;
  const SmallText({
    super.key, 
    required this.txt});

  @override
  Widget build(BuildContext context) {
    return Text(txt,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),);
  }
}