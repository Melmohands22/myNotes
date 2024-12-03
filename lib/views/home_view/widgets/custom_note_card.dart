import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/models/note_model.dart';
import 'package:nots_app/views/home_view/widgets/edit_notes.dart';

class NotesGridView extends StatelessWidget {
  final List<NoteModel> notes;
  final VoidCallback onUpdate;

  const NotesGridView({
    super.key,
    required this.notes,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];

        return CustomNotesCard(
          note: note,
          onDelete: () async {},
          onUpdate: onUpdate,
          index: index,
        );
      },
    );
  }
}

class CustomNotesCard extends StatelessWidget {
  final NoteModel note;
  final Future<void> Function() onDelete;
  final VoidCallback onUpdate;
  final int index;

  const CustomNotesCard({
    super.key,
    required this.note,
    required this.onDelete,
    required this.onUpdate,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.pushNamed(
          context,
          EditNoteView.id,
          arguments: {
            'index': index,
            'color': note.color,
            'title': note.title,
            'subtitle': note.subtitle,
          },
        );

        if (result == true) {
          onUpdate();
        }
      },
      child: Dismissible(
        key: ValueKey(note.key),
        direction: DismissDirection.horizontal,
        confirmDismiss: (direction) async {
          await onDelete();
          return true;
        },
        background: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 30.h),
          color: Colors.red,
          child: Icon(
            Icons.delete,
            color: kWhiteColor,
            size: 42.h,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 200.w,
              minHeight: 120.h,
            ),
            child: Card(
              color: Color(note.color),
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      note.title,
                      style: GoogleFonts.playfairDisplay(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      note.subtitle,
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    SizedBox(height: 8.w),
                    Text(
                      note.date,
                      style: TextStyle(
                        fontSize: 12.w,
                        color: Color.fromARGB(255, 50, 47, 47),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
