class TaskRepository {
  final List<String> tasks = [];

  List<String> getTasks() {
    return List.from(tasks);
  }

  void addTask(String task) {
    tasks.add(task);
  }

  void removeTask(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index);
    }
  }
}
