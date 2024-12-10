import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/controllers/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:nots_app/controllers/utils/text_direction.dart';
import 'package:nots_app/generated/l10n.dart';
import 'package:nots_app/models/tasks_model.dart';
import 'package:nots_app/views/tasks_view/widgets/category_card_list_view.dart';
import 'package:nots_app/views/tasks_view/widgets/create_task_btn.dart';
import 'package:nots_app/views/tasks_view/widgets/date_choose.dart';
import 'package:nots_app/views/tasks_view/widgets/show_dropdwon.dart';
import 'package:nots_app/views/tasks_view/widgets/task_input_decor.dart';

class CreateTaskView extends StatefulWidget {
  const CreateTaskView({super.key});
  static String id = 'CreateTaskView';

  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();
  String selectedCategory = "Development";
  String selectedStartTime = "01:00 AM";
  String selectedEndTime = "02:00 AM";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Theme.of(context).iconTheme.color,
                    size: 28.h,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Icon(
                    Icons.drive_file_move_outline,
                    color: Theme.of(context).iconTheme.color,
                    size: 28.h,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Create New Task",
                    style: GoogleFonts.lato(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: FaIcon(
                    FontAwesomeIcons.rectangleList,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 18),
              child: Text(
                "Task Name",
                style: GoogleFonts.lato(color: kBlueColor, fontSize: 18.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 18, right: 8),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return S.of(context).title_req;
                  }
                  return null;
                },
                textDirection: getTextDirection(taskNameController.text),
                controller: taskNameController,
                decoration: TaskInputDecoration.getDecoration(
                    hintText: "Enter Task Name!"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 18),
              child: Text(
                "Select Category",
                style: GoogleFonts.lato(color: kBlueColor, fontSize: 18.sp),
              ),
            ),
            SizedBox(height: 8.h),
            CategoryCardListView(),
            DateChoose(),
            SizedBox(
              height: 28.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Text(
                    "Start time",
                    style: GoogleFonts.lato(
                        color: kBlueColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: Text(
                    "End time",
                    style: GoogleFonts.lato(
                        color: kBlueColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ShowDropdownButton(
                isStartTime: true,
                onTimeSelected: (time) {
                  setState(() {
                    selectedStartTime = time;
                  });
                },
              ),
              ShowDropdownButton(
                isStartTime: false,
                onTimeSelected: (time) {
                  setState(() {
                    selectedEndTime = time;
                  });
                },
              )
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 18),
              child: Text(
                "Description",
                style: GoogleFonts.lato(color: kBlueColor, fontSize: 18.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 18, right: 8),
              child: TextFormField(
                controller: taskDescController,
                decoration: TaskInputDecoration.getDecoration(
                    hintText: "Enter your description"),
              ),
            ),
            CreateTaskButton(
              onTap: () {
                if (taskNameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Task name cannot be empty!")),
                  );
                  return;
                }

                final newTask = TasksModel(
                  taskName: taskNameController.text,
                  taskDesc: taskDescController.text,
                  taskDate: selectedStartTime,
                  taskCategory: selectedCategory,
                );

                context.read<TasksCubit>().addTask(newTask);

                taskNameController.clear();
                taskDescController.clear();

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
