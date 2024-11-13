import 'package:flutter/material.dart';
import 'package:nots_app/constants.dart';

class ColorsItem extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorsItem({
    super.key,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: CircleAvatar(
          backgroundColor: color,
          child: isSelected ? Icon(Icons.check, color: kWhiteColor) : null,
        ),
      ),
    );
  }
}
