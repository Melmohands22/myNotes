import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/models/note_model.dart';

part 'notes_state.dart';

class AddNotesCubit extends Cubit<NotesState> {
  AddNotesCubit() : super(NotesInitial());

  Future<void> addNote(NoteModel note) async {
    emit(NotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      final noteExists = notesBox.values
          .any((existingNote) => existingNote.title == note.title);

      if (!noteExists) {
        await notesBox.add(note);
        emit(NotesSuccess());
      } else {
        emit(NotesFailure('Note already exists.'));
      }
    } catch (e) {
      if (e is HiveError) {
        emit(NotesFailure('Database error: ${e.message}'));
      } else {
        emit(NotesFailure('An unexpected error occurred.'));
      }
    }
  }
}
