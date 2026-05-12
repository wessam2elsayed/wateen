import 'package:flutter/material.dart';
import 'package:wateen/featuers/azkar/presentation/screen/azkar_screen.dart';
import 'package:wateen/featuers/home/presentation/screen/home_screen.dart';
import 'package:wateen/featuers/home/presentation/screen/main_screen.dart';
import 'package:wateen/featuers/prayer/presentation/screen/prayer_screen.dart';
import 'package:wateen/featuers/quran/presentation/screen/quran_screen.dart';
import 'package:wateen/featuers/settings/presentation/screen/settings_screen.dart';


abstract class AppRoutes {
  static const String main = "/MainScreen";
  static const String home = "/HomeScreen";
  static const String prayer = "/Prayer";
  static const String quran = "/Quran";
  static const String azkar = "/Azkar";
  static const String theSettings ="/Settings";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      case home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());

      case prayer:
        return MaterialPageRoute(builder: (_) => const PrayerScreen());

      case quran:
        return MaterialPageRoute(builder: (_) => const QuranScreen());

      case azkar:
        return MaterialPageRoute(builder: (_) => const AzkarScreen());

      case theSettings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());  
    }
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text("No route defined for ${settings.name}")),
      ),
    );
  }
}