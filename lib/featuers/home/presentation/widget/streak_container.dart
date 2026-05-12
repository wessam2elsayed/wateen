import 'package:flutter/material.dart';
import 'package:wateen/core/localization/l10n/app_localizations.dart';
import 'package:wateen/core/theme/app_colors.dart';

class StreakContainer extends StatefulWidget {
  final String txt;
  const StreakContainer({
    super.key, 
    required this.txt});

  @override
  State<StreakContainer> createState() => _StreakContainerState();
}

class _StreakContainerState extends State<StreakContainer> {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20)),
          gradient: LinearGradient(
            colors: isDark
                     ? [AppColors.darkGray,
                       AppColors.gray,
                       AppColors.lightgray]
                    :[
                       AppColors.darkblue,
                       AppColors.blue,
                       AppColors.lightblue              
                      ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,           
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: locale.streak,
                      style: TextStyle(                    
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      )),
                      
                    TextSpan(
                      text: widget.txt,
                      style: TextStyle(
                        fontSize: 50,
                        color: AppColors.red,

                      )
                      ), 
                      TextSpan(
                      text: locale.days,
                      style: TextStyle(                    
                        fontSize: 20
                      )), 
                  ]
                ),)
              
            ],
          ),
        ),
    );
  }
}