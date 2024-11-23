part of 'app_language_cubit.dart';

@immutable
abstract class AppLanguageState {}

class AppLanguageInitial extends AppLanguageState {}

class AppLanguageChanged extends AppLanguageState {
  final String languageCode;
  AppLanguageChanged(this.languageCode);
}
