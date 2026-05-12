import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  final String txt;
  const LargeText({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Text(txt,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),);
  }
}