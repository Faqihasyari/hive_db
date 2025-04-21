import 'package:hive/hive.dart';

part 'note_database.g.dart';

@HiveType(typeId: 0 )
class Notes extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? desc;
}