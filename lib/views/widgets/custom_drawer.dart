import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nots_app/generated/l10n.dart';
import 'package:nots_app/views/search_view.dart';
import 'package:nots_app/views/tasks_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor, Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 16.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).title,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildDrawerItem(
                  context,
                  icon: Icons.home,
                  label: 'Ta\'amulat',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                buildDrawerItem(
                  context,
                  icon: Icons.search,
                  label: 'Search',
                  onTap: () {
                    Navigator.pushNamed(context, SearchView.id);
                  },
                ),
                buildDrawerItem(
                  context,
                  icon: FontAwesomeIcons.listCheck,
                  label: 'Tasks',
                  onTap: () {
                    Navigator.pushNamed(context, TasksView.id);
                  },
                ),
                Divider(
                  thickness: 1.h,
                  indent: 16.w,
                  endIndent: 16.w,
                  color: Colors.grey.shade300,
                ),
                buildDrawerItem(
                  context,
                  icon: Icons.settings,
                  label: 'Settings',
                  onTap: () {},
                ),
                buildDrawerItem(
                  context,
                  icon: Icons.info_outline,
                  label: 'About',
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'v1.0.0',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  '© 2024 Ta\'amulat',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrawerItem(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
        size: 24.h,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
