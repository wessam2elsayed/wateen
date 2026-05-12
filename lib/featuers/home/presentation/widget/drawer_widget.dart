import 'package:flutter/material.dart';
import 'package:wateen/core/localization/l10n/app_localizations.dart';
import 'package:wateen/core/theme/app_colors.dart';
import 'package:wateen/core/widgets/large_text.dart';

class DrawerWidget extends StatelessWidget {
  final String txt;
  final VoidCallback onTap;
  const DrawerWidget({
    super.key, 
    required this.txt, 
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    
    return Drawer(
        width: 200,
        backgroundColor: AppColors.blue,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              LargeText(txt: locale.screens),
              InkWell(
                onTap: onTap,
                child: LargeText(txt: txt)),
            ],
          ),
        ),
      );
  }
}