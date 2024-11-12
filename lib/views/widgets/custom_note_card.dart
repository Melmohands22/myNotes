import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/models/note_model.dart';
import 'package:nots_app/views/widgets/edit_notes.dart';

class NotesGridView extends StatefulWidget {
  const NotesGridView({super.key});

  @override
  _NotesGridViewState createState() => _NotesGridViewState();
}

class _NotesGridViewState extends State<NotesGridView> {
  late Box<NoteModel> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box<NoteModel>(kNotesBok);
  }

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

            setState(() {});
          },
          index: index,
        );
      },
    );
  }
}

class CustomNotesCard extends StatelessWidget {
  final NoteModel note;
  final Future<void> Function() onDelete;
  final int index;

  const CustomNotesCard({
    super.key,
    required this.note,
    required this.onDelete,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(note.key),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        await onDelete();
        return true;
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.h),
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 38.h,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              EditNoteView.id,
              arguments: {
                'index': index,
                'color': note.color,
                'title': note.title,
                'subtitle': note.subtitle,
              },
            );
          },
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.5,
              minHeight: 100.h,
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
                        color: Color(0xff024959),
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
