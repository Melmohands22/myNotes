import 'package:flutter/material.dart';
import 'package:nots_app/views/constants.dart';
import 'package:nots_app/views/widgets/custom_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  void createNote() {
    CustomShowDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: CustomAppbar(),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 110,
                ),
                Image.asset("assets/images/rafiki.png"),
                Text(
                  "Create your first note !",
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    color: kWhiteColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            left: 299,
            child: SizedBox(
              height: 69,
              width: 70,
              child: FloatingActionButton(
                backgroundColor: kDarkColor,
                onPressed: createNote,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
                child: Icon(
                  Icons.add,
                  size: 48,
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> CustomShowDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: SizedBox(
          height: 300,
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your note title',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
                maxLines: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your note subtitle',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
                maxLines: 5,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
