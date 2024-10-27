import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/views/widgets/custom_note_card.dart';
import 'package:nots_app/views/widgets/custom_show_dialog.dart';
import 'package:nots_app/views/widgets/empty_show.dart';
import 'package:nots_app/views/widgets/custom_appbar.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => const CustomShowDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: CustomAppbar(),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: EmptyShow(),
          ),
          MasonryGridView.builder(
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: 4,
            itemBuilder: (context, index) {
              return CustomNotesCard();
            },
          ),
          Positioned(
            bottom: 60,
            left: 299,
            child: SizedBox(
              height: 69,
              width: 70,
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
            ),
          ),
        ],
      ),
    );
  }
}
