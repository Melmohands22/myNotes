import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nots_app/constants.dart';

AppBar CustomAppbar() {
  return AppBar(
      backgroundColor: kDarkColor,
      title: Padding(
        padding:  EdgeInsets.only(left: 8.0.h),
        child: Text(
          "Notes",
          style: TextStyle(
              fontSize: 43.sp, fontWeight: FontWeight.w300, color: kWhiteColor),
        ),
      ),
      actions: [
        Stack(
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.r),
                  ),
                  color: Color(0xff3B3B3B)),
            ),
            IconButton(
                onPressed: () {},
                icon:  Icon(
                  Icons.search,
                  color: kWhiteColor,
                  size: 24.h,
                )),
          ],
        ),
         SizedBox(
          width: 10.w,
        ),
        Padding(
          padding:  EdgeInsets.only(right: 8.0.h),
          child: Stack(
            children: [
              Container(
                width: 50.w,
                height: 50.h,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.r),
                    ),
                    color: Color(0xff3B3B3B)),
              ),
              IconButton(
                  onPressed: () {},
                  icon:  Icon(
                    Icons.settings,
                    color: kWhiteColor,
                    size: 24.h,
                  )),
            ],
          ),
        ),
      ]);
}
