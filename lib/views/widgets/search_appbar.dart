import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nots_app/generated/l10n.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController searchController;
  final Function(String) onSearch;

  const SearchAppBar({
    super.key,
    required this.searchController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(
        color: Theme.of(context).iconTheme.color,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: TextFormField(
        textDirection: _textDirection(searchController.text),
        controller: searchController,
        onChanged: onSearch,
        decoration: InputDecoration(
          hintStyle:
              TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
          filled: true,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          hintText: S.of(context).search_placeholder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

TextDirection _textDirection(String text) {
  final arabicRegex = RegExp(r'[\u0600-\u06FF]');
  return arabicRegex.hasMatch(text) ? TextDirection.rtl : TextDirection.ltr;
}
