import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/controllers/cubits/app_language/app_language_cubit.dart';
import 'package:nots_app/controllers/cubits/notes_cubit/notes_cubit.dart';
import 'package:nots_app/controllers/cubits/theme_cubit/theme_cubit.dart';
import 'package:nots_app/generated/l10n.dart';
import 'package:nots_app/models/note_model.dart';

import 'package:nots_app/views/notes_view.dart';
import 'package:nots_app/views/search_view.dart';
import 'package:nots_app/views/widgets/edit_notes.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures proper initialization.
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());

  try {
    await Hive.openBox<NoteModel>(kNotesBok);
  } catch (e) {
    print('Hive initialization error: $e');
  }

  runApp(const MyNotes());
}

class MyNotes extends StatelessWidget {
  const MyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNotesCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => AppLanguageCubit()..loadSavedLanguage()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) => BlocBuilder<AppLanguageCubit, AppLanguageState>(
          builder: (context, languageState) {
            String currentLanguage = languageState is AppLanguageChanged
                ? languageState.languageCode
                : 'en';

            return BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (_, themeMode) {
                return MaterialApp(
                  locale: Locale(currentLanguage),
                  localizationsDelegates: [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: themeMode,
                  routes: {
                    EditNoteView.id: (context) => EditNoteView(),
                    SearchView.id: (context) => SearchView(),
                  },
                  debugShowCheckedModeBanner: false,
                  home: const NotesView(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
