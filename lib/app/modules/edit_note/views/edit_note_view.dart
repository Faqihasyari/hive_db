import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_note_controller.dart';

class EditNoteView extends GetView<EditNoteController> {
  const EditNoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('EDIT NOTE'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: controller.titleC,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: controller.descC,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            Obx(
              () => ElevatedButton(onPressed: () {
                if(controller.isLoading.isFalse){}
              }, child: Text(controller.isLoading.isFalse ?"EDIT NOTE" : "LOADING....")),
            )
          ],
        ));
  }
}
