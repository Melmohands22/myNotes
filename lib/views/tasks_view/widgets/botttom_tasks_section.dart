import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/controllers/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:nots_app/models/tasks_model.dart';
import 'package:nots_app/views/tasks_view/widgets/task_card.dart';

class BottomTasksSection extends StatelessWidget {
  const BottomTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 325.h,
      child: Container(
        decoration: BoxDecoration(
          color: kCustomBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
        ),
        height: 440.h,
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<TasksCubit, List<TasksModel>>(
          builder: (context, tasks) {
            if (tasks.isEmpty) {
              return Center(
                child: Text(
                  "No tasks available. Create a new task!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.all(16.r),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];

                DateTime? parsedTime;
                try {
                  parsedTime = DateFormat('hh:mm a').parse(task.taskDate);
                } catch (e) {
                  debugPrint("Error parsing time: ${task.taskDate}");
                }

                return TaskCard(
                  title: task.taskName,
                  subtitle: task.taskDesc,
                  image: 'assets/images/ddsd.PNG',
                  time: parsedTime ?? DateTime.now(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
