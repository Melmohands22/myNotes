import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/models/tasks_model.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  Future<void> addTask(TasksModel task) async {
    emit(TasksLoading());
    try {
      var tasksBox = Hive.box<TasksModel>(kTasksBox);
      final taskExists = tasksBox.values
          .any((existingTask) => existingTask.taskName == task.taskName);
      if (!taskExists) {
        await tasksBox.add(task);
        emit(TasksSuccess());
      } else {
        emit(TasksFailure('Task already exists.'));
      }
    } catch (e) {
      emit(TasksFailure(e.toString()));
    }
  }
}
