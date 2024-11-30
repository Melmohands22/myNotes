import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});
  static String id = "TasksView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r)),
              ),
              height: 330.h,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 140.h,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 28, right: 24, top: 28),
                        child: FaIcon(
                          FontAwesomeIcons.bars,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 28),
                        child: FaIcon(
                          FontAwesomeIcons.bell,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 200.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color
                        ?.withOpacity(0.1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
