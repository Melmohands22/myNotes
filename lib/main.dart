import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/controllers/cubits/notes_cubit/notes_cubit.dart';
import 'package:nots_app/models/note_model.dart';

import 'package:nots_app/views/notes_view.dart';
import 'package:nots_app/views/widgets/edit_notes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNotesBok);

  runApp(const MyNotes());
}

class MyNotes extends StatelessWidget {
  const MyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNotesCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            routes: {
              EditNoteView.id: (context) => EditNoteView(),
            },
            color: kDarkColor,
            debugShowCheckedModeBanner: false,
            home: NotesView(),
          );
        },
      ),
    );
  }
}
