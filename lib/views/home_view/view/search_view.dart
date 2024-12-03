import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/generated/l10n.dart';
import 'package:nots_app/models/note_model.dart';
import 'package:nots_app/views/home_view/widgets/custom_note_card.dart';
import 'package:nots_app/views/home_view/widgets/search_appbar.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});
  static String id = 'SearchView';

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late Box<NoteModel> box;
  List<NoteModel> filteredNotes = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    box = Hive.box<NoteModel>(kNotesBox);
    filteredNotes = [];
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void searchNotes(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredNotes = [];
      });
    } else {
      final notes = box.values.where((note) {
        return (note.title.toLowerCase() ?? '').contains(query.toLowerCase()) ||
            (note.subtitle.toLowerCase() ?? '').contains(query.toLowerCase());
      }).toList();
      setState(() {
        filteredNotes = notes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: SearchAppBar(
        searchController: searchController,
        onSearch: searchNotes,
      ),
      body: searchController.text.isEmpty
          ? Center(
              child: Text(
                S.of(context).search_intial,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: 18.sp,
                ),
              ),
            )
          : (filteredNotes.isEmpty)
              ? Center(
                  child: Text(
                    'No results found for "${searchController.text}".',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 18.sp,
                    ),
                  ),
                )
              : NotesGridView(
                  notes: filteredNotes,
                  onUpdate: () => searchNotes(searchController.text),
                ),
    );
  }
}
