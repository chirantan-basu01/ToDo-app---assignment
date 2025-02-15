import '../database/task_dao.dart';
import '../database/task.dart';

class TaskRepository {
  final TaskDao taskDao;

  TaskRepository(this.taskDao);

  Future<List<Task>> getAllTasks() => taskDao.getAllTasks();
  Future<void> addTask(String title) => taskDao.insertTask(Task(title: title, isCompleted: false));
  Future<void> removeTask(Task task) => taskDao.deleteTask(task);
  Future<void> updateTask(Task task) => taskDao.updateTask(task);

}
