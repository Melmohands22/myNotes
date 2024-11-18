import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nots_app/constants.dart';

class EmptyShow extends StatelessWidget {
  const EmptyShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * (4 / 38),
        ),
        Image.asset("assets/images/rafiki.png"),
        Text(
          "Create your first note!",
          style: GoogleFonts.nunito(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 20.sp),
        ),
      ],
    );
  }
}
