import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nots_app/views/tasks_view/view/create_task_view.dart';

class HeadTasksSection extends StatelessWidget {
  const HeadTasksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.0.r, top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              "My Task",
              style: GoogleFonts.lato(
                  color: Theme.of(context).cardColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 18),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, CreateTaskView.id);
              },
              child: Container(
                height: 45.h,
                width: 45.w,
                decoration: BoxDecoration(
                    color: const Color(0xffff439ae1),
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                child: Center(
                  child: FaIcon(FontAwesomeIcons.plus,
                      color: Theme.of(context).iconTheme.color),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
