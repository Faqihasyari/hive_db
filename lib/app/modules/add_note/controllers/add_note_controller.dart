import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive_db/app/data/db/note_database.dart';

class AddNoteController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();

  void addNote() async {
    Notes note = Notes()
    ..id = 0
      ..title = titleC.text
      ..desc = descC.text;

      final box = NoteManager.getAllNotes();
      int id = await box.add(note);
  }
}
