import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/views/tasks_view/widgets/task_name_decor.dart';

class DateChoose extends StatefulWidget {
  const DateChoose({super.key});

  @override
  State<DateChoose> createState() => _DateChooseState();
}

class _DateChooseState extends State<DateChoose> {
  DateTime date = DateTime.now();

  final TextEditingController dateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat("EEEE, d, MMMM").format(date);
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 14,
          ),
          child: Text(
            "Date",
            style: GoogleFonts.lato(color: kBlueColor, fontSize: 18.sp),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 8),
                child: TextFormField(
                  controller: dateController,
                  readOnly: true,
                  style: GoogleFonts.lato(
                      fontSize: 20.sp, fontWeight: FontWeight.w800),
                  decoration: TaskNameDecoration.getDecoration(
                      hintText: "Select a date"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 8),
              child: IconButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2100),
                  );
                  if (newDate == null) return;
                  setState(() {
                    date = newDate;
                    dateController.text =
                        DateFormat("EEEE, d, MMMM").format(newDate);
                  });
                },
                icon: Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                      color: kCustomBlue,
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.calendarDays,
                      size: 28.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
