import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive/hive.dart';
import 'package:nots_app/models/note_model.dart';
import 'package:nots_app/views/home_view/view/empty_show.dart';
import 'package:nots_app/views/home_view/widgets/custom_note_card.dart';

class NoNotesView extends StatelessWidget {
  const NoNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: EmptyShow(),
    );
  }
}

class Notes extends StatelessWidget {
  final Box<NoteModel> box;

  const Notes({super.key, required this.box});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: box.length,
      itemBuilder: (context, index) {
        final note = box.getAt(index) as NoteModel;
        return CustomNotesCard(
          note: note,
          onDelete: () async {
            await box.deleteAt(index);
          },
          index: index,
          onUpdate: () {},
        );
      },
    );
  }
}
