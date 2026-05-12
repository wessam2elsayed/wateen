import 'package:flutter/material.dart';
import 'package:wateen/core/localization/l10n/app_localizations.dart';
import 'package:wateen/core/theme/app_colors.dart';

class Counter extends StatelessWidget {
  final String txt;
  final VoidCallback onTap;

  const Counter({
    super.key, 
    required this.txt, 
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
                onTap: onTap,
                child: 
                CircleAvatar(
                  radius: 80,
                  backgroundColor: isDark
                  ? AppColors.darkGray
                   : AppColors.darkblue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(txt,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 40
                      ),
                      ),

                      Text(locale.press,
                      style: TextStyle(
                        color: AppColors.white
                      ),)
                    ],
                  ),
                  
                ),
              );
  }
}