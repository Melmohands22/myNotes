import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/models/tasks_model.dart';

class TasksCubit extends Cubit<List<TasksModel>> {
  TasksCubit() : super([]) {
    fetchTasks();
  }

  String startTime = "01:00 AM";
  String endTime = "02:00 AM";

  String get currentStartTime => startTime;
  String get currentEndTime => endTime;

  final DateFormat _timeFormat = DateFormat('hh:mm a');

  Future<void> fetchTasks() async {
    try {
      var tasksBox = Hive.box<TasksModel>(kTasksBox);
      final tasks = tasksBox.values.toList();

      tasks.sort((a, b) {
        final dateA = _timeFormat.parse(a.taskDate);
        final dateB = _timeFormat.parse(b.taskDate);
        return dateA.compareTo(dateB);
      });

      emit(tasks);
    } catch (e) {
      print('Error fetching tasks: $e');
    }
  }

  Future<void> addTask(TasksModel task) async {
    try {
      var tasksBox = Hive.box<TasksModel>(kTasksBox);
      await tasksBox.add(task);

      final tasks = tasksBox.values.toList();
      tasks.sort((a, b) {
        final dateA = _timeFormat.parse(a.taskDate);
        final dateB = _timeFormat.parse(b.taskDate);
        return dateA.compareTo(dateB);
      });

      emit(tasks);
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  void setStartTime(String newTime) {
    startTime = newTime;
    emit([...state]);
  }

  void setEndTime(String newTime) {
    endTime = newTime;
    emit([...state]);
  }
}
