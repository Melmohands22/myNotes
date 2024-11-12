import 'package:flutter/material.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/views/widgets/custom_show_dialog.dart';
class FloatinfButton extends StatefulWidget {
  const FloatinfButton({super.key});

  @override
  State<FloatinfButton> createState() => _FloatinfButtonState();
}

class _FloatinfButtonState extends State<FloatinfButton> {
  void createNote() {
    print("Floating Action Button Pressed");  // Debugging print
    showDialog(
      context: context,
      builder: (context) => const CustomShowDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 60,
      right: 16,  // Adjusted positioning for better visibility
      child: FloatingActionButton(
        backgroundColor: kDarkColor,
        onPressed: createNote,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        child: Icon(
          Icons.add,
          size: 48,
          color: kWhiteColor,
        ),
      ),
    );
  }
}
