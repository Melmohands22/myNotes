import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/generated/l10n.dart';
import 'package:nots_app/models/note_model.dart';
import 'package:nots_app/views/home_view/widgets/conf_button.dart';

class DeleteNotesAlarm extends StatefulWidget {
  const DeleteNotesAlarm({super.key});

  @override
  State<DeleteNotesAlarm> createState() => _DeleteNotesAlarmState();
}

class _DeleteNotesAlarmState extends State<DeleteNotesAlarm> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SizedBox(
        height: 300.h,
        width: 300.w,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(
                height: 24.h,
              ),
              Center(
                  child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        gradient: RadialGradient(colors: [
                          const Color.fromARGB(255, 161, 23, 13),
                          Colors.red,
                          const Color.fromARGB(255, 244, 201, 201)
                        ]),
                        borderRadius: BorderRadius.all(
                          Radius.circular(24.h),
                        )),
                    width: 26.w,
                    height: 35.h,
                  ),
                  Icon(Icons.warning),
                ],
              )),
              SizedBox(
                height: 18.h,
              ),
              Text(
                S.of(context).delete_all_notes,
                style: GoogleFonts.aladin(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 22.sp),
              ),
              Text(
                S.of(context).confirm_delete,
                style: GoogleFonts.andika(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 12.sp),
              ),
              Text(
                S.of(context).this_action_cannot_be_undone,
                style: GoogleFonts.andika(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 12.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.all(8.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ConfButton(
                      text: S.of(context).cancel,
                      color: const Color.fromARGB(255, 240, 221, 221),
                      textColor: Colors.black,
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                    ConfButton(
                      text: S.of(context).confirm,
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () async {
                        final notesBox = Hive.box<NoteModel>(kNotesBox);
                        await Future.delayed(const Duration(seconds: 2));
                        notesBox.clear();
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
