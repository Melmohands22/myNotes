import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  static const String themeKey = 'app_theme';
  static const String themeBox = 'themeBox';

  Future<void> loadTheme() async {
    final box = Hive.box(themeBox);
    final isDarkMode = box.get(themeKey, defaultValue: false);
    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> toggleTheme() async {
    final box = Hive.box(themeBox);
    final isDarkMode = state == ThemeMode.light;
    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    await box.put(themeKey, isDarkMode);
  }
}

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xff323232),
  scaffoldBackgroundColor: Color(0xff323232),
  cardColor: Color(0xff323232),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Color(0xffDCE8F2),
  cardColor: Color(0xffDCE8F2),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
  ),
);
