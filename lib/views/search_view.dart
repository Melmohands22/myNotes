import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:nots_app/constants.dart';
import 'package:nots_app/models/note_model.dart';
import 'package:nots_app/views/widgets/custom_note_card.dart';
import 'package:nots_app/views/widgets/search_appbar.dart';

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
    filteredNotes = box.values.toList(); 
  }

  void searchNotes(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredNotes = box.values.toList(); 
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
    final hasNotes = box.isNotEmpty;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: SearchAppBar(
        searchController: searchController,
        onSearch: searchNotes,
      ),
      body: !hasNotes
          ? Center(
              child: Text(
                'No notes available. Add some notes first!',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: 18.sp,
                ),
              ),
            )
          : (filteredNotes.isEmpty && searchController.text.isNotEmpty)
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
                  onUpdate: updateNotes,
                ),
    );
  }
}
