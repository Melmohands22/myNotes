import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nots_app/generated/l10n.dart';

class EmptyShow extends StatelessWidget {
  const EmptyShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * (4 / 38)),
            Image.asset("assets/images/rafiki.png"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).empty_message,
                style: GoogleFonts.nunito(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 24.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
