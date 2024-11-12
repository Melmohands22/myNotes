import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/models/note_model.dart';
import 'package:nots_app/views/widgets/colors_item.dart';

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
      backgroundColor: kDarkColor,
      appBar: AppBar(
        leading: BackButton(
          color: kWhiteColor,
        ),
        backgroundColor: kDarkColor,
        title: const Text(
          'Edit Note',
          style: TextStyle(color: kWhiteColor),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.h),
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
                controller: subtitleController,
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
               SizedBox(height: 30.h),
              Padding(
                padding:  EdgeInsets.all(6.0.h),
                child: SizedBox(
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

                    var notesBox = Hive.box<NoteModel>(kNotesBok);
                    notesBox.putAt(index!, newNote);

                    Navigator.of(context).pop();
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.onUserInteraction;
                    });
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
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
