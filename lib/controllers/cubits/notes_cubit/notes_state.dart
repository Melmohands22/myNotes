part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesSuccess extends NotesState {}

final class NotesFailure extends NotesState {
  final String errMessage;
  NotesFailure(this.errMessage);
}

final class NotesLoading extends NotesState {}
