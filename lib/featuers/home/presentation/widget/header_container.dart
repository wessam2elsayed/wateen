import 'package:flutter/material.dart';
import 'package:wateen/core/localization/l10n/app_localizations.dart';
import 'package:wateen/core/theme/app_colors.dart';
import 'package:wateen/core/widgets/small_text.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key});

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
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,           
            children: [
              SmallText(txt: locale.courage),
              SmallText(txt: locale.great),
              SmallText(txt: locale.keep),
            ],
          ),
        ),
    );
  }
}