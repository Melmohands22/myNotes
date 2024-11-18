import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/controllers/utils/custom_button.dart';
import 'package:nots_app/views/widgets/colors_item.dart';

class CustomNoteInput extends StatefulWidget {
  const CustomNoteInput({super.key});

  @override
  State<CustomNoteInput> createState() => _CustomNoteInputState();
}

class _CustomNoteInputState extends State<CustomNoteInput> {
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SizedBox(
        height: 430.h,
        width: 300.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Title is required';
                }
                return null;
              },
              decoration: _inputDecoration('Enter your note title'),
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
              maxLines: 2,
              textDirection: _getTextDirection(titleController.text),
              onChanged: (_) {
                setState(() {});
              },
            ),
            SizedBox(height: 20.h),
            TextFormField(
              controller: subtitleController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Subtitle is required';
                }
                return null;
              },
              decoration: _inputDecoration('Enter your note subtitle'),
              style:  TextStyle(color:Theme.of(context).textTheme.bodyLarge?.color,),
              maxLines: 5,
              textDirection: _getTextDirection(subtitleController.text),
              onChanged: (_) {
                setState(() {});
              },
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 35.h,
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
            SizedBox(height: 20.h),
            AddNoteButton(
              buttonName: 'Add',
              formKey: formKey,
              selectedColor: selectedColor,
              titleController: titleController,
              subtitleController: subtitleController,
              onSaveSuccess: () {
                Navigator.of(context).pop();
              },
              setAutovalidateMode: () {
                setState(() {
                  autovalidateMode = AutovalidateMode.onUserInteraction;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  TextDirection _getTextDirection(String text) {
    final arabicRegex = RegExp(r'[\u0600-\u06FF]');
    return arabicRegex.hasMatch(text) ? TextDirection.rtl : TextDirection.ltr;
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey[400]),
      filled: true,
      fillColor: Colors.grey[800],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(color: Colors.red),
      ),
    );
  }
}
