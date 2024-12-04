import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class TimeCard extends StatelessWidget {
  const TimeCard({
    super.key,
    required this.time,
  });

  final DateTime time;

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat('hh:mm a').format(time);
    return Container(
      height: 55.h,
      width: 150.w,
      decoration: BoxDecoration(
        color: Theme.of(context).iconTheme.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.r),
          bottomRight: Radius.circular(18.r),
        ),
      ),
      child: Center(
        child: Text(
          formattedTime,
          style: GoogleFonts.lato(
            color: Theme.of(context).primaryColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
