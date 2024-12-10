import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/controllers/cubits/app_language/app_language_cubit.dart';
import 'package:nots_app/controllers/cubits/notes_cubit/notes_cubit.dart';
import 'package:nots_app/controllers/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:nots_app/controllers/cubits/theme_cubit/theme_cubit.dart';
import 'package:nots_app/generated/l10n.dart';
import 'package:nots_app/models/note_model.dart';
import 'package:nots_app/models/tasks_model.dart';

import 'package:nots_app/views/home_view/view/notes_view.dart';
import 'package:nots_app/views/home_view/view/search_view.dart';
import 'package:nots_app/views/tasks_view/view/create_task_view.dart';
import 'package:nots_app/views/tasks_view/view/tasks_view.dart';
import 'package:nots_app/views/home_view/widgets/edit_notes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  Hive.registerAdapter(TasksModelAdapter());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  try {
    await Hive.openBox<TasksModel>(kTasksBox);
    await Hive.openBox<NoteModel>(kNotesBox);
    await Hive.openBox(kThemeBox);
  } catch (e) {}

  runApp(const MyNotes());
}

class MyNotes extends StatelessWidget {
  const MyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksCubit()),
        BlocProvider(create: (context) => AddNotesCubit()),
        BlocProvider(create: (context) => ThemeCubit()..loadTheme()),
        BlocProvider(
            create: (context) => AppLanguageCubit()..loadSavedLanguage()),
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
                SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: themeMode == ThemeMode.dark
                        ? Brightness.light
                        : Brightness.dark,
                    systemNavigationBarColor: themeMode == ThemeMode.dark
                        ? Colors.black
                        : Colors.white,
                    systemNavigationBarIconBrightness:
                        themeMode == ThemeMode.dark
                            ? Brightness.light
                            : Brightness.dark,
                  ),
                );

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
                    TasksView.id: (context) => TasksView(),
                    CreateTaskView.id: (context) => CreateTaskView(),
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
