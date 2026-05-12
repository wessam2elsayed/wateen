import 'package:flutter/material.dart';
import 'package:wateen/core/theme/app_colors.dart';
import 'package:wateen/core/widgets/large_text.dart';


class AzkarContainer extends StatelessWidget {
  final String txt;
  final int count;
  final int targetCount;
  final VoidCallback onTap;
  final VoidCallback onPressed;
  final bool isDone;

  const AzkarContainer({
    super.key, 
    required this.txt, 
    required this.count, 
    required this.targetCount, 
    required this.onTap, 
    required this.onPressed, 
    required this.isDone
    });
  
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: 30,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isDark
          ? isDone? AppColors.darkGray :AppColors.gray
          : isDone? AppColors.blue :AppColors.lightblue,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(
            color: isDark
            ? AppColors.gray
            : AppColors.darkblue,
            blurRadius: 10,
            offset: Offset(0, 5)
          )]
        ),
      
        child: Row(
          children: [
            LargeText(txt: txt),
            Spacer(),
            LargeText(txt: "$count / $targetCount"),
            IconButton(
              onPressed: onPressed, 
              icon: Icon(Icons.arrow_drop_down))
      
          ],
        )
        // 
      ),
    );
  }
}

