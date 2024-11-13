import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/models/note_model.dart';

class AddNoteButton extends StatelessWidget {
  final String buttonName;
  final GlobalKey<FormState> formKey;
  final Color selectedColor;
  final TextEditingController titleController;
  final TextEditingController subtitleController;
  final VoidCallback onSaveSuccess;
  final VoidCallback setAutovalidateMode;

  const AddNoteButton({
    super.key,
    required this.buttonName,
    required this.formKey,
    required this.selectedColor,
    required this.titleController,
    required this.subtitleController,
    required this.onSaveSuccess,
    required this.setAutovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final newNote = NoteModel(
            selectedColor.value,
            title: titleController.text,
            subtitle: subtitleController.text,
            date: DateFormat('HH:mm    dd-MM-yyyy').format(DateTime.now()),
          );

          var notesBox = Hive.box<NoteModel>(kNotesBok);
          notesBox.add(newNote);

          onSaveSuccess();
        } else {
          setAutovalidateMode();
        }
      },
      child: Container(
        height: 25.h,
        width: 80.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8.r),
            ),
            color: kWhiteColor),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(
              color: kDarkColor,
            ),
          ),
        ),
      ),
    );
  }
}
