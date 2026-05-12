import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wateen/core/localization/l10n/app_localizations.dart';
import 'package:wateen/core/routes/app_routes.dart';
import 'package:wateen/core/services/get_it_services.dart';
import 'package:wateen/core/theme/app_theme.dart';
import 'package:wateen/featuers/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:wateen/featuers/home/presentation/cubit/home_cubit.dart';
import 'package:wateen/featuers/prayer/presentation/cubit/prayer_cubit.dart';
import 'package:wateen/featuers/quran/presentation/cubit/quran_cubit.dart';
import 'package:wateen/featuers/settings/cubit/local/cubit/locale_cubit.dart';
import 'package:wateen/featuers/settings/cubit/theme/theme_cubit.dart';
import 'package:wateen/featuers/splash_screen.dart';

class Wateen extends StatelessWidget {
  const Wateen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetItServices.getIt<PrayerCubit>()),
        BlocProvider(create: (context) => GetItServices.getIt<AzkarCubit>()),
        BlocProvider(create: (context) => GetItServices.getIt<QuranCubit>()),
        BlocProvider(create: (context) => GetItServices.getIt<HomeCubit>()),
        BlocProvider(create: (context) => GetItServices.getIt<ThemeCubit>()),
        BlocProvider(create: (context) => GetItServices.getIt<LocaleCubit>()),
      ],

      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, localeState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                themeMode: themeMode,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,

                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: localeState,

                home: SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}

 // theme: ThemeData(
            //   brightness: Brightness.light,
            //   // primaryColor: AppColors.darkblue,
            //   scaffoldBackgroundColor: Colors.white,
            //   appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkblue),
            // ),

            // darkTheme: ThemeData(
            //   brightness: Brightness.dark,
            //   scaffoldBackgroundColor: AppColors.black,
            //   appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkGray),
            
            // ),
