import 'package:floor/floor.dart';

@entity
class Task {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;
  final bool isCompleted;

  Task({this.id, required this.title, required this.isCompleted});

  Task copyWith({int? id, String? title, bool? isCompleted}) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
