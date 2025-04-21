import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_db/app/routes/app_pages.dart';

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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => Get.toNamed(
              Routes.EDIT_NOTE,
              arguments: index,
            ),
            leading: CircleAvatar(
              child: Text("${index + 1}"),
            ),
            title: Text("TITLE ${index + 1}"),
            subtitle: Text("DESC ${index + 1}"),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_NOTE),
        child: Icon(Icons.add),
      ),
    );
  }
}
