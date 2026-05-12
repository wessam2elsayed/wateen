import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wateen/core/localization/l10n/app_localizations.dart';
import 'package:wateen/core/theme/app_colors.dart';
import 'package:wateen/core/widgets/app_bar_text.dart';
import 'package:wateen/core/widgets/custome_drawer.dart';
import 'package:wateen/core/widgets/large_text.dart';
import 'package:wateen/featuers/settings/cubit/local/cubit/locale_cubit.dart';
import 'package:wateen/featuers/settings/cubit/theme/theme_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.darkGray : AppColors.darkblue,
        title: AppBarText(txt: locale.settings),
        centerTitle: true,
        iconTheme: IconThemeData(
        color:AppColors.white, // اختاري اللون اللي يناسبك
        ),
      ),

      drawer: CustomeDrawer(),
      
      body: ListView(
        children: [
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, state) {
              return SwitchListTile(
                title: LargeText(txt: isDark ? locale.dark : locale.light),
                secondary: Icon(
                  state == ThemeMode.dark ? Icons.dark_mode : Icons.dark_mode,
                  color: state == ThemeMode.dark
                      ? AppColors.gray
                      : AppColors.darkblue,
                ),
                value: state == ThemeMode.dark,
                onChanged: (bool value) {
                  context.read<ThemeCubit>().toggleTheme();
                },
              );
            },
          ),

          const Divider(),

          BlocBuilder<LocaleCubit, Locale>(
            builder: (context, state) {
              return SwitchListTile(
                title: LargeText(
                  txt: locale.language),
                  secondary: Icon(
                    Icons.language,
                    color: isDark
                    ?AppColors.gray
                    :AppColors.darkblue,),
                value: state.languageCode == 'ar',
                onChanged: (bool value) {
                  context.read<LocaleCubit>().toggleLanguage();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
