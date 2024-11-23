// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Ta'amulat`
  String get title {
    return Intl.message(
      'Ta\'amulat',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Create your first Ta'amul`
  String get empty_message {
    return Intl.message(
      'Create your first Ta\'amul',
      name: 'empty_message',
      desc: '',
      args: [],
    );
  }

  /// `Delete All Ta'amulat`
  String get delete_all_notes {
    return Intl.message(
      'Delete All Ta\'amulat',
      name: 'delete_all_notes',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete all Ta'amulat?`
  String get confirm_delete {
    return Intl.message(
      'Are you sure you want to delete all Ta\'amulat?',
      name: 'confirm_delete',
      desc: '',
      args: [],
    );
  }

  /// `This action cannot be undone.`
  String get this_action_cannot_be_undone {
    return Intl.message(
      'This action cannot be undone.',
      name: 'this_action_cannot_be_undone',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search_hint {
    return Intl.message(
      'Search',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  /// `What are you searching for?`
  String get search_placeholder {
    return Intl.message(
      'What are you searching for?',
      name: 'search_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `No Ta'amulat available. Add some first!`
  String get search_intial {
    return Intl.message(
      'No Ta\'amulat available. Add some first!',
      name: 'search_intial',
      desc: '',
      args: [],
    );
  }

  /// `No results found for`
  String get search_empty {
    return Intl.message(
      'No results found for',
      name: 'search_empty',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Ta'amul title`
  String get title_txt {
    return Intl.message(
      'Enter your Ta\'amul title',
      name: 'title_txt',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Ta'amul Subtitle`
  String get subtitle_txt {
    return Intl.message(
      'Enter your Ta\'amul Subtitle',
      name: 'subtitle_txt',
      desc: '',
      args: [],
    );
  }

  /// `Add Ta'amul`
  String get add_btn {
    return Intl.message(
      'Add Ta\'amul',
      name: 'add_btn',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save_btn {
    return Intl.message(
      'Save',
      name: 'save_btn',
      desc: '',
      args: [],
    );
  }

  /// `Ar`
  String get ar {
    return Intl.message(
      'Ar',
      name: 'ar',
      desc: '',
      args: [],
    );
  }

  /// `En`
  String get en {
    return Intl.message(
      'En',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `Edit Ta'amulat`
  String get edit_Taamulat {
    return Intl.message(
      'Edit Ta\'amulat',
      name: 'edit_Taamulat',
      desc: '',
      args: [],
    );
  }

  /// `Title is required`
  String get title_req {
    return Intl.message(
      'Title is required',
      name: 'title_req',
      desc: '',
      args: [],
    );
  }

  /// `Subtitle is required`
  String get subtitle_req {
    return Intl.message(
      'Subtitle is required',
      name: 'subtitle_req',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
