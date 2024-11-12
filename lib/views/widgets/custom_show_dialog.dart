import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/models/note_model.dart';
import 'package:intl/intl.dart';
import 'package:nots_app/views/widgets/colors_item.dart';

class CustomShowDialog extends StatefulWidget {
  const CustomShowDialog({super.key});

  @override
  State<CustomShowDialog> createState() => _CustomShowDialogState();
}

class _CustomShowDialogState extends State<CustomShowDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  NoteModel? noteModel;

  final List<Color> colors = [
    Colors.blueAccent,
    Colors.redAccent,
    Color(0xff732D1A),
    Colors.orangeAccent,
    Colors.purpleAccent,
    Color(0xffF5E6AF),
    Colors.tealAccent,
    Color(0xff486241),
    Colors.cyanAccent,
    Colors.indigoAccent,
    Colors.lightGreenAccent,
    Colors.deepOrangeAccent,
    Color(0xff7A577A),
  ];

  Color selectedColor = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sp),
      ),
      content: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SizedBox(
          height: 320.h,
          width: 300.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                onSaved: (value) => title = value,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
                decoration: _inputDecoration('Enter your note title'),
                style: const TextStyle(color: Colors.white),
                maxLines: 2,
              ),
               SizedBox(height: 20.h),
              TextFormField(
                onSaved: (value) => subtitle = value,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Subtitle is required';
                  }
                  return null;
                },
                decoration: _inputDecoration('Enter your note subtitle'),
                style: const TextStyle(color: Colors.white),
                maxLines: 5,
              ),
               SizedBox(height: 20.h),
              SizedBox(
                height: 30.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: colors.map((color) {
                      return ColorsItem(
                        color: color,
                        isSelected: color == selectedColor,
                        onTap: () {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();

              final newNote = NoteModel(
                selectedColor.value,
                title: title!,
                subtitle: subtitle!,
                date: DateFormat('HH:mm    dd-MM-yyyy').format(DateTime.now()),
              );

              var notesBox = Hive.box<NoteModel>(kNotesBok);
              notesBox.add(newNote);

              Navigator.of(context).pop();
            } else {
              setState(() {
                autovalidateMode = AutovalidateMode.onUserInteraction;
              });
            }
          },
          child: const Text(
            'Add',
            style: TextStyle(color: kWhiteColor),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey[400]),
      filled: true,
      fillColor: Colors.grey[800],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.sp),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.sp),
        borderSide: BorderSide(color: Colors.red),
      ),
    );
  }
}
