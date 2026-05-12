
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final Box _settingsBox = Hive.box('settings'); // افتحي بوكس للإعدادات في الـ main

  ThemeCubit() : super(ThemeMode.light) {
    getSavedTheme();
  }

  void toggleTheme() {
    final newMode = (state == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    emit(newMode);
    _settingsBox.put('isDark', newMode == ThemeMode.dark);
  }

  void getSavedTheme() {
    bool isDark = _settingsBox.get('isDark', defaultValue: false);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}

