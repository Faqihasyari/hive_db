import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive_db/app/data/db/note_database.dart';

class AddNoteController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();

  void addNote() async {
    if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
      //Membuat Tanpa ID
      Notes note = Notes()
        ..title = titleC.text
        ..desc = descC.text;

      final box = NoteManager.getAllNotes();

      //DAPET ID AUTO INCREMENT
      int id = await box.add(note);
      note.id = id;
      await note.save();

      //EDIT NOTE => DENGAN ID YANG KITA DAPAT
      print("ID : $id");
      print("BERHASIL MENAMBAHKAN DATA KE BOX (LOCA STORAGE DENGAN HIVE)");

      print(box.get(id)?.id);
      print(box.get(id)?.title);
      print(box.get(id)?.desc);
    }
  }
}
