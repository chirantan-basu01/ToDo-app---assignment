import '../database/task.dart';

abstract class TodoEvent {}

class LoadTasksEvent extends TodoEvent {}

class AddTaskEvent extends TodoEvent {
  final String addTask;
  AddTaskEvent(this.addTask);
}

class RemoveTaskEvent extends TodoEvent {
  final Task removeTask;
  RemoveTaskEvent(this.removeTask);
}

class EditTaskEvent extends TodoEvent {
  final Task updatedTask;
  EditTaskEvent(this.updatedTask);
}

class ToggleTaskCompletionEvent extends TodoEvent {
  final Task taskCompleted;
  ToggleTaskCompletionEvent(this.taskCompleted);
}
