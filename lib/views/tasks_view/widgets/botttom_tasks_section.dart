import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nots_app/views/tasks_view/widgets/task_card.dart';

class BottomTasksSection extends StatelessWidget {
  const BottomTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 325.h,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff439ae1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
        ),
        height: 440.h,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: EdgeInsets.all(16.r),
          children: [
            TaskCard(
              title: "Team Meeting",
              subtitle: "Discuss all questions\nabout the new project",
              image: "assets/images/ddsd.PNG",
              time: DateTime.now(),
            ),
            TaskCard(
              title: "Call the Stylist",
              subtitle: "Agree on an evening look",
              image: "assets/images/rb_6565.png",
              time: DateTime.now().add(Duration(hours: 1)),
            ),
            TaskCard(
              title: "Shopping List",
              subtitle: "Buy groceries and snacks",
              image: "assets/images/rb_6565.png",
              time: DateTime.now().add(Duration(hours: 2)),
            ),
          ],
        ),
      ),
    );
  }
}
