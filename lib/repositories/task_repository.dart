import '../database/task_dao.dart';
import '../database/task.dart';

class TaskRepository {
  final TaskDao taskDao;

  TaskRepository(this.taskDao);

  Future<List<Task>> getAllTasks() => taskDao.getAllTasks();
  Future<void> addTask(String title) => taskDao.insertTask(Task(title: title));
  Future<void> removeTask(Task task) => taskDao.deleteTask(task);
}
