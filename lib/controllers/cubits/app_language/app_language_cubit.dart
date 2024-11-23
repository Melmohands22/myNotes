import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nots_app/controllers/models/Enums/languagesEventType.dart';

part 'app_language_state.dart';

class AppLanguageCubit extends Cubit<AppLanguageState> {
  AppLanguageCubit() : super(AppLanguageInitial());

  final String _languageBox = 'languageBox';
  final String _languageKey = 'selectedLanguage';

  Future<void> appLanguageFunc(LanguagesEventEnums eventType) async {
    String languageCode = eventType == LanguagesEventEnums.ArabicLanguage ? 'ar' : 'en';

    var box = await Hive.openBox(_languageBox);
    await box.put(_languageKey, languageCode);

    emit(AppLanguageChanged(languageCode));
  }

  Future<void> loadSavedLanguage() async {
    var box = await Hive.openBox(_languageBox);
    String savedLanguage = box.get(_languageKey, defaultValue: 'en');
    emit(AppLanguageChanged(savedLanguage));
  }
}
