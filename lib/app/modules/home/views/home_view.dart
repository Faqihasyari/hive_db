import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_db/app/data/db/note_database.dart';
import 'package:hive_db/app/routes/app_pages.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALL NOTES'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<Notes>>(
          valueListenable: NoteManager.getAllNotes().listenable(),
          builder: (context, box, _) {
            List<Notes> allNotes = box.values.toList().cast<Notes>();
            return ListView.builder(
              itemCount: allNotes.length,
              itemBuilder: (context, index) {
                Notes note = allNotes[index];
                return ListTile(
                  onTap: () => Get.toNamed(
                    Routes.EDIT_NOTE,
                    arguments: note,
                  ),
                  leading: CircleAvatar(
                    child: Text("${note.id}"),
                  ),
                  title: Text(" ${note.title}"),
                  subtitle: Text(" ${note.desc}"),
                  trailing:
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_NOTE),
        child: Icon(Icons.add),
      ),
    );
  }
}
