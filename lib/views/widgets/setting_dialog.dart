import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/controllers/cubits/theme_cubit/theme_cubit.dart';

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
    final themeCubit = context.read<ThemeCubit>();

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 20.0),
                child: Text(
                  "Dark Mode",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 24.0.sp,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 20.0),
                child: Switch(
                  value: context.read<ThemeCubit>().state == ThemeMode.light,
                  onChanged: (value) {
                    themeCubit.toggleTheme();
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
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 24.0.sp,
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
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 24.0.sp,
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
        ]),
      ),
    );
  }
}
