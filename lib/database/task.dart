import 'package:floor/floor.dart';

@entity
class Task {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;

  Task({this.id, required this.title});

  Task copyWith({int? id, String? title}) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}
