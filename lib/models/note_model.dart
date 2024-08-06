import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 32)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int coloe;
  NoteModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.coloe,
  });
}
