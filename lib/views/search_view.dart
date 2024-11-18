import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/views/widgets/custom_note_card.dart';
import 'package:nots_app/views/widgets/search_appbar.dart';
import 'package:hive/hive.dart';
import 'package:nots_app/models/note_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});
  static String id = 'SearchView';

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late Box<NoteModel> box;
  List<NoteModel> filteredNotes = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    box = Hive.box<NoteModel>(kNotesBok);
  }

  void searchNotes(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredNotes = [];
      });
    } else {
      final notes = box.values.where((note) {
        return note.title.toLowerCase().contains(query.toLowerCase()) ||
            note.subtitle.toLowerCase().contains(query.toLowerCase());
      }).toList();
      setState(() {
        filteredNotes = notes;
      });
    }
  }

  void updateNotes() {
    searchNotes(searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: SearchAppBar(
        searchController: searchController,
        onSearch: searchNotes,
      ),
      body: filteredNotes.isEmpty && searchController.text.isEmpty
          ? Center(
              child: Text(
                'What are you searching for..?',
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 18.sp),
              ),
            )
          : NotesGridView(
              notes: filteredNotes,
              onUpdate: updateNotes,
            ),
    );
  }
}
