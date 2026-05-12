import 'package:flutter/material.dart';
import 'package:wateen/core/localization/l10n/app_localizations.dart';
import 'package:wateen/core/routes/app_routes.dart';
import 'package:wateen/core/theme/app_colors.dart';
import 'package:wateen/core/widgets/app_bar_text.dart';

class CustomeDrawer extends StatelessWidget {
  const CustomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final locale = AppLocalizations.of(context)!;

    Widget DrawerItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
    
    return Drawer(
      width: 200,
      backgroundColor: isDark
      ?AppColors.darkGray
      :AppColors.lightblue,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: isDark
            ?AppColors.darkGray
            :AppColors.darkblue,
            child: Center(
              child: AppBarText(
                txt: locale.wateen),
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                DrawerItem(
                  title:locale.home,
                  onTap: (){
                    Navigator.pop(context);
                  Navigator.pushNamed(context, AppRoutes.main);
                  }
                ),

                DrawerItem(
                  title:locale.prayer,
                  onTap: (){
                    Navigator.pop(context);
                  Navigator.pushNamed(context, AppRoutes.prayer);
                  }
                  
                ),
            
                DrawerItem(
                  title:locale.quran,
                  onTap: (){
                    Navigator.pop(context);
                  Navigator.pushNamed(context, AppRoutes.quran);
                  }
                  
                ),
            
                DrawerItem(
                  title:locale.azkar,
                  onTap: (){
                    Navigator.pop(context);
                  Navigator.pushNamed(context, AppRoutes.azkar);
                  }
                ),
            
                const Divider(),
            
                DrawerItem(
                  title:locale.settings,
                  onTap: (){
                    Navigator.pop(context);
                  Navigator.pushNamed(context, AppRoutes.theSettings);
                  }
                  
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



