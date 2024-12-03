import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DaysCard extends StatelessWidget {
  const DaysCard({
    super.key,
    required this.dayNum,
    required this.dayChar,
    required this.isSelected,
    required this.onTap,
  });

  final String dayNum;
  final String dayChar;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.h,
        width: 70.w,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffff439ae1) : Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
          border: Border.all(
              color: isSelected ? Colors.transparent : Colors.grey, width: 1.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayNum,
              style: GoogleFonts.lato(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              dayChar,
              style: GoogleFonts.lato(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
