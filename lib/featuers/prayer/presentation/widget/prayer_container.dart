import 'package:flutter/material.dart';
import 'package:wateen/core/theme/app_colors.dart';
import 'package:wateen/core/widgets/large_text.dart';


class PrayerContainer extends StatelessWidget {
  final String txt;
  final bool isDone;
  final ValueChanged<bool?> onCheckChanged;
  const PrayerContainer({
    super.key, 
    required this.txt, 
    required this.isDone, 
    required this.onCheckChanged});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 60,
      margin: EdgeInsets.all(10),
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isDark
          ? isDone? AppColors.darkGray:AppColors.gray
          : isDone? AppColors.blue:AppColors.lightblue,
        
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: 20,),
            LargeText(txt: txt),                          
              Spacer(),
              // SmallText(txt: AppStrings.done),
              // const SizedBox(width: 10,),
              Checkbox(
                value: isDone, 
                onChanged: onCheckChanged,
                activeColor: AppColors.white,
                side: BorderSide(color: Colors.black, width: 2),
                fillColor: MaterialStateProperty.all(AppColors.white 
                ),
                checkColor: AppColors.green,),                            
          ],
        ),
    );
  }
}