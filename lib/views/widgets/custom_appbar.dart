import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/views/search_view.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  late bool _isSelected;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kDarkColor,
      title: Padding(
        padding: EdgeInsets.only(left: 8.0.h),
        child: Text(
          "Notes",
          style: TextStyle(
            fontSize: 43.sp,
            fontWeight: FontWeight.w300,
            color: kWhiteColor,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, SearchView.id);
          },
          icon: Icon(
            Icons.search,
            color: kWhiteColor,
            size: 24.h,
          ),
        ),
        SizedBox(width: 10.w),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const SettingDialog(),
            );
          },
          icon: Icon(
            Icons.settings,
            color: kWhiteColor,
            size: 24.h,
          ),
        ),
      ],
    );
  }
}

class SettingDialog extends StatefulWidget {
  const SettingDialog({super.key});

  @override
  State<SettingDialog> createState() => _SettingDialogState();
}

class _SettingDialogState extends State<SettingDialog> {
  bool light = true;

  final List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 300.0.h,
        width: 300.0.w,
        decoration: BoxDecoration(
          color: kDarkColor,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: kWhiteColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12.0.h, left: 20.h),
                  child: Text(
                    "Dark Mode",
                    style: GoogleFonts.alegreya(
                      color: kWhiteColor,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 12.h, right: 20.h),
                  child: Switch(
                    inactiveThumbColor: Colors.grey,
                    activeColor: Colors.blue,
                    value: light,
                    onChanged: (bool value) {
                      setState(() {
                        light = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12.0.h, left: 20.h),
                  child: Text(
                    "Language",
                    style: GoogleFonts.alegreya(
                      color: kWhiteColor,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 12.0.h, right: 20.h),
                  child: ToggleButtons(
                    isSelected: _isSelected,
                    onPressed: (int index) {
                      setState(() {
                        for (int i = 0; i < _isSelected.length; i++) {
                          _isSelected[i] = i == index;
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(20.r),
                    selectedColor: Colors.white,
                    fillColor: Colors.blue,
                    color: Colors.grey,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                        child: Text("Ar", style: TextStyle(fontSize: 18.sp)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                        child: Text("En", style: TextStyle(fontSize: 18.sp)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 28.h),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12.0.h, left: 20.h),
                  child: Text(
                    "Delete All Notes",
                    style: GoogleFonts.alegreya(
                      color: kWhiteColor,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 12.h, right: 20.h),
                  child: IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.trashCan,
                      size: 28,
                    ),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
