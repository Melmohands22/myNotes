import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/views/tasks_view/widgets/category_card.dart';

class CreateTaskView extends StatefulWidget {
  const CreateTaskView({super.key});
  static String id = 'CreateTaskView';

  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  int selectedIndex = -1;
  DateTime date = DateTime.now();
  final TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat("EEEE, d, MMMM").format(date);
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

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
                decoration: taskNameDecoration("Enter Task Name!"),
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
            categoryCardListView(),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 18),
              child: Text(
                "Date",
                style: GoogleFonts.lato(color: kBlueColor, fontSize: 18.sp),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, right: 8),
                    child: TextFormField(
                      controller: dateController,
                      readOnly: true,
                      style: GoogleFonts.lato(
                          fontSize: 20.sp, fontWeight: FontWeight.w600),
                      decoration: taskNameDecoration("Select a date"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 8),
                  child: IconButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2100),
                      );
                      if (newDate == null) return;
                      setState(() {
                        date = newDate;
                        dateController.text =
                            DateFormat("EEEE, d, MMMM").format(newDate);
                      });
                    },
                    icon: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          color: kCustomBlue,
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.calendarDays,
                          size: 28.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox categoryCardListView() {
    return SizedBox(
      height: 100.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < 5; i++)
              Padding(
                padding: EdgeInsets.only(left: i == 0 ? 18 : 14),
                child: CategoryCard(
                  isSelected: selectedIndex == i,
                  onTap: () {
                    setState(() {
                      selectedIndex = i;
                    });
                  },
                  cateName: [
                    "Development",
                    "Research",
                    "Design",
                    "Flutter",
                    "UI/UX"
                  ][i],
                ),
              ),
          ],
        ),
      ),
    );
  }

  InputDecoration taskNameDecoration(String hintTxt) {
    return InputDecoration(
      hintText: hintTxt,
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: 16.sp,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
          width: 1.5,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blueAccent,
          width: 2,
        ),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),
    );
  }
}
