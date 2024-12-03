import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/models/note_model.dart';
import 'package:nots_app/views/home_view/widgets/custom_drawer.dart';
import 'package:nots_app/views/home_view/widgets/custom_floating_button.dart';

import 'package:nots_app/views/home_view/widgets/custom_appbar.dart';
import 'package:nots_app/views/home_view/widgets/no_notes_view.dart';

class NotesView extends StatefulWidget {
  const NotesView({
    super.key,
  });

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    var notesBox = Hive.box<NoteModel>(kNotesBox);

    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: ValueListenableBuilder(
        valueListenable: notesBox.listenable(),
        builder: (context, Box<NoteModel> box, _) {
          if (box.isEmpty) {
            return const NoNotesView();
          } else {
            return Notes(box: box);
          }
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 60.0.h, right: 16.h),
        child: const FloatingButton(),
      ),
    ));
  }
}
