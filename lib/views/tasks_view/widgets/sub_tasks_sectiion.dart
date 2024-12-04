import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubTasksSection extends StatelessWidget {
  const SubTasksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 26.0, top: 4),
          child: Text(
            "Today",
            style: GoogleFonts.lato(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, right: 12),
          child: Text(
            "Monday , 1 jun ",
            style: GoogleFonts.lato(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.color
                    ?.withOpacity(0.7)),
          ),
        )
      ],
    );
  }
}
