import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/views/search_view.dart';
import 'package:nots_app/views/widgets/setting_dialog.dart';

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
