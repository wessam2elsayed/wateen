import 'package:flutter/material.dart';
import 'package:wateen/core/localization/l10n/app_localizations.dart';
import 'package:wateen/core/theme/app_colors.dart';

class UpdateButton extends StatelessWidget {
  final VoidCallback onPressed;
  const UpdateButton({
    super.key, 
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isDark
        ? AppColors.darkGray
        : AppColors.darkblue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
         onPressed: onPressed, 
      child: Text(locale.update,
         style: TextStyle(
          fontSize: 20,
          color: AppColors.white
         ),)
      
     );
  }
}