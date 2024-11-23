import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nots_app/views/widgets/custom_show_dialog.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => const CustomShowDialog(),
    );
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
    );
  }
}
