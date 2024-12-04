import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nots_app/views/tasks_view/widgets/TimeCard.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.time,
  });

  final String title;
  final String subtitle;
  final String image;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 45.0),
          child: Container(
            height: 150.h,
            width: 290.w,
            margin: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(16.r),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 14.r, bottom: 3),
                  child: SizedBox(
                    height: 100.h,
                    width: 90.w,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, left: 20),
                        child: Text(
                          title,
                          style: GoogleFonts.lato(
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w900,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 20),
                        child: Text(
                          subtitle,
                          style: GoogleFonts.lato(
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.color
                                ?.withOpacity(0.4),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 135.h,
          right: 5.w,
          child: TimeCard(time: time),
        ),
      ],
    );
  }
}
