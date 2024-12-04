
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.cateName,
  });

  final VoidCallback onTap;
  final bool isSelected;
  final String cateName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 120.w,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffff439ae1) : Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          border: Border.all(
              color: isSelected ? Colors.transparent : Colors.grey, width: 1.w),
        ),
        child: Center(
          child: Text(
            cateName,
            style: GoogleFonts.lato(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
