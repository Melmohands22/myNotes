import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nots_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  AddNote(NoteModel note){
    
  }
}
