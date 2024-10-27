import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  AddNote(NoteModel note) async {
    emit(NotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBok);
      emit(NotesSuccess());
      await notesBox.add(note);
    } on Exception catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}
