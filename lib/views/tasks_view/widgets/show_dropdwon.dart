import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final List<String> hoursList = List.generate(
  24,
  (index) {
    final hour = index % 12 == 0 ? 12 : index % 12;
    final period = index < 12 ? 'AM' : 'PM';
    return '${hour.toString().padLeft(2, '0')}:00 $period';
  },
);

class ShowDropdownButton extends StatefulWidget {
  const ShowDropdownButton({super.key});

  @override
  State<ShowDropdownButton> createState() => _ShowDropdownButtonState();
}

class _ShowDropdownButtonState extends State<ShowDropdownButton> {
  String dropdownValue = hoursList.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, top: 8, right: 14),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Padding(
          padding: const EdgeInsets.only(left: 14, bottom: 14),
          child: Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 44.sp,
          ),
        ),
        elevation: 14,
        style: TextStyle(
            color: Theme.of(context).textTheme.bodySmall?.color,
            fontSize: 22.sp,
            fontWeight: FontWeight.w800),
        underline: Container(
          height: 2.h,
          color: Colors.grey,
        ),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        items: hoursList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Text(value),
            ),
          );
        }).toList(),
        menuMaxHeight: 180,
      ),
    );
  }
}
