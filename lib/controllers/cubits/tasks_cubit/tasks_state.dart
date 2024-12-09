part of 'tasks_cubit.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}
final class TasksSuccess extends TasksState {}

final class TasksFailure extends TasksState {
  final String errMessage;
  TasksFailure(this.errMessage);
}

final class TasksLoading extends TasksState {}
