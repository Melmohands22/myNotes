import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nots_app/views/tasks_view/widgets/category_card.dart';

class CategoryCardListView extends StatefulWidget {
  const CategoryCardListView({super.key});

  @override
  _CategoryCardListViewState createState() => _CategoryCardListViewState();
}

class _CategoryCardListViewState extends State<CategoryCardListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
}
