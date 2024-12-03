import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTaskView extends StatelessWidget {
  const CreateTaskView({super.key});
  static String id = 'CreateTaskView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Theme.of(context).iconTheme.color,
                    size: 28.h,
                  )),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Icon(
                  Icons.drive_file_move_outline,
                  color: Theme.of(context).iconTheme.color,
                  size: 28.h,
                ),
              )
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  "Create New Task",
                  style: GoogleFonts.lato(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: FaIcon(FontAwesomeIcons.rectangleList),
              )
            ],
          )
        ],
      ),
    );
  }
}
