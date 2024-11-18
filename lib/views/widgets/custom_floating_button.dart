import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/views/widgets/custom_show_dialog.dart';

class FloatinfButton extends StatefulWidget {
  const FloatinfButton({super.key});

  @override
  State<FloatinfButton> createState() => _FloatinfButtonState();
}

class _FloatinfButtonState extends State<FloatinfButton> {
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => const CustomShowDialog(),
    );
  }
late bool _splitScreenMode;

  @override
  void initState() {
    super.initState();
    _splitScreenMode = false;  
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 60.h,
      right: 16.h,
      child: FloatingActionButton(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        onPressed: createNote,
        heroTag: 'createNoteButton_${UniqueKey()}',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48.r),
        ),
        child: Icon(
          Icons.add,
          size: 48.h,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
