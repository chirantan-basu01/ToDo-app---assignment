import 'package:assignment_app/database/task.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM Task')
  Future<List<Task>> getAllTasks();

  @insert
  Future<void> insertTask(Task task);

  @delete
  Future<void> deleteTask(Task task);
}
