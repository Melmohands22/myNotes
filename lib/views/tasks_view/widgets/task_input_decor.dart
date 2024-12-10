import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskInputDecoration {
  static InputDecoration getDecoration({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: 16.sp,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
          width: 1.5,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blueAccent,
          width: 2,
        ),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),
    );
  }
}
