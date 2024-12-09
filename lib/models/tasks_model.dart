import 'package:hive/hive.dart';

part 'tasks_model.g.dart';

@HiveType(typeId: 1) 
class TasksModel {
  @HiveField(0)
  final String taskName;

  @HiveField(1)
  final String taskDesc;

  @HiveField(2)
  final String taskDate;

  @HiveField(3)
  final String taskCategory;

  TasksModel({
    required this.taskName,
    required this.taskDesc,
    required this.taskDate,
    required this.taskCategory,
  });
}
