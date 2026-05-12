import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wateen/core/theme/app_colors.dart';
import 'package:wateen/core/widgets/large_text.dart';

class HabitContainer extends StatelessWidget {
  final String txt;
  final String img;
  final double percent;
  final VoidCallback onTap;


  const HabitContainer({
    super.key, 
    required this.txt, 
    required this.img, 
    required this.onTap,  
    required this.percent, 
    });

  @override
  Widget build(BuildContext context) {
    
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 80,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isDark
               ? AppColors.gray
               : AppColors.lightblue,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(
          color: isDark
          ? AppColors.lightgray
          : AppColors.darkblue,
          blurRadius: 10,
          offset: Offset(0, 5)
        )]
      ),

      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Lottie.asset(img,
                  height: 150,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
            LargeText(txt: txt),
            

              Spacer(),
              const SizedBox(width: 10,),
              
              CircularProgressIndicator(
                value: percent,
                backgroundColor: AppColors.gray,
                color: isDark
                   ? AppColors.darkGray
                   :AppColors.darkblue,
              ),
              const SizedBox(width: 5,),
              Text("${(percent * 100).toInt()}%"),
              IconButton(onPressed: onTap , 
              icon: Icon(Icons.arrow_forward_ios),
                ),
   
          ],
        ),
      );
    
  }
}
