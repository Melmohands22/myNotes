import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void toggleTheme() {
    emit(state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
  }
}

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Color(0xff323232),
  cardColor: Color(0xff323232),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Color(0xffDCE8F2),
  cardColor: Color(0xffDCE8F2),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
  ),
);
