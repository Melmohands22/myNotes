import 'package:flutter/material.dart';
import 'package:nots_app/views/constants.dart';
import 'package:nots_app/views/notes_view.dart';

void main() async {
  runApp(const MyNotes());
}

class MyNotes extends StatelessWidget {
  const MyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: kDarkColor,
      debugShowCheckedModeBanner: false,
      home: NotesView(),
    );
  }
}
