import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/models/note_model.dart';
import 'package:nots_app/views/widgets/custom_floating_button.dart';
import 'package:nots_app/views/widgets/custom_note_card.dart';
import 'package:nots_app/views/empty_show.dart';
import 'package:nots_app/views/widgets/custom_appbar.dart';

class NotesView extends StatefulWidget {
  const NotesView({
    super.key,
  });

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    var notesBox = Hive.box<NoteModel>(kNotesBok);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(),
      body: ValueListenableBuilder(
        valueListenable: notesBox.listenable(),
        builder: (context, Box<NoteModel> box, _) {
          return Stack(
            children: [
              if (box.isEmpty) NoNotesView() else Notes(box: box),
              const FloatinfButton(),
            ],
          );
        },
      ),
    );
  }
}

class NoNotesView extends StatelessWidget {
  const NoNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FloatinfButton(),
        SizedBox(
          width: double.infinity,
          child: EmptyShow(),
        ),
      ],
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
