import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nots_app/constants.dart';

class CreateTaskButton extends StatelessWidget {
  const CreateTaskButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0, left: 50, bottom: 60),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60.h,
          width: 280.w,
          decoration: BoxDecoration(
              color: kBlueColor,
              borderRadius: BorderRadius.all(Radius.circular(14))),
          child: Center(
            child: Text(
              "Create Task",
              style: GoogleFonts.lato(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: 28,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
