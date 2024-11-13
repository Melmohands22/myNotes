import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nots_app/views/widgets/custom_note_input.dart';

class CustomShowDialog extends StatefulWidget {
  const CustomShowDialog({super.key});

  @override
  State<CustomShowDialog> createState() => _CustomShowDialogState();
}

class _CustomShowDialogState extends State<CustomShowDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      content: CustomNoteInput(),
    );
  }
}
