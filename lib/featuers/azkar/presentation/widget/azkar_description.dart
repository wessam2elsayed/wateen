import 'package:flutter/material.dart';
import 'package:wateen/core/theme/app_colors.dart';
import 'package:wateen/core/widgets/large_text.dart';

class AzkarDescription extends StatelessWidget {
  final String txt;
  final String des;
  const AzkarDescription({
    super.key, 
    required this.txt, 
    required this.des});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
         padding: EdgeInsets.all(20),
         decoration: BoxDecoration(
          color: isDark
          ? AppColors.darkGray
          : AppColors.white
         ),
           child: SingleChildScrollView(
             child: Column(
                     children: [
                         Container(
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                                 color: AppColors.gray,
                                 borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                         const SizedBox(height: 20),
                        LargeText(txt:  txt),
                        const SizedBox(height: 15),
                        LargeText(txt: des),
                      ],
                   ),
            )
          );
  }
}