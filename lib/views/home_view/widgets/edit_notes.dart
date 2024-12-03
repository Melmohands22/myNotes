import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import 'package:nots_app/constants.dart';
import 'package:nots_app/generated/l10n.dart';
import 'package:nots_app/models/note_model.dart';
import 'package:nots_app/views/home_view/widgets/colors_item.dart';

class EditNoteView extends StatefulWidget {
  static const String id = 'EditNoteView';

  const EditNoteView({super.key});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, subtitle;
  NoteModel? noteModel;
  late TextEditingController titleController;
  late TextEditingController subtitleController;
  late int color;
  int? index;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final List<Color> colors = [
    Colors.blueAccent,
    Colors.redAccent,
    Color(0xff732D1A),
    Colors.orangeAccent,
    Colors.purpleAccent,
    Color(0xffC2C0A6),
    Color(0xff4B4952),
    Color(0xff486241),
    Color(0xff03A688),
    Color(0xff7A6D31),
    Color(0xffA8B545),
    Color(0xff7A577A),
    Color(0xff8C034E),
    Color(0xff001542),
  ];

  Color selectedColor = Colors.blueAccent;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments as Map;
    titleController = TextEditingController(text: args['title']);
    subtitleController = TextEditingController(text: args['subtitle']);
    color = args['color'];
    index = args['index'];

    selectedColor = Color(color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: BackButton(
          color: Theme.of(context).iconTheme.color,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          S.of(context).edit_Taamulat,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  onSaved: (value) => title = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S.of(context).title_req;
                    }
                    return null;
                  },
                  decoration: _inputDecoration(S.of(context).title_txt),
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color),
                  maxLines: 2,
                  textDirection: getTextDirection(titleController.text),
                  onChanged: (_) {
                    setState(() {});
                  },
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: subtitleController,
                  onSaved: (value) => subtitle = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S.of(context).subtitle_req;
                    }
                    return null;
                  },
                  decoration: _inputDecoration(S.of(context).subtitle_txt),
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color),
                  maxLines: 8,
                  textDirection: getTextDirection(subtitleController.text),
                  onChanged: (_) {
                    setState(() {});
                  },
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.all(6.0.h),
                  child: SizedBox(
                    height: 40.h,
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
                ),
                SizedBox(
                  height: 40.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      final newNote = NoteModel(
                        selectedColor.value,
                        title: title!,
                        subtitle: subtitle!,
                        date: DateFormat('HH:mm    dd-MM-yyyy')
                            .format(DateTime.now()),
                      );

                      var notesBox = Hive.box<NoteModel>(kNotesBox);
                      notesBox.putAt(index!, newNote);

                      Navigator.pop(context, true);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.onUserInteraction;
                      });
                    }
                  },
                  child: Text(S.of(context).save_btn),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
      filled: true,
      fillColor: Theme.of(context).scaffoldBackgroundColor,
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

ui.TextDirection getTextDirection(String text) {
  final arabicRegex = RegExp(r'[\u0600-\u06FF]');
  return arabicRegex.hasMatch(text)
      ? ui.TextDirection.rtl
      : ui.TextDirection.ltr;
}
