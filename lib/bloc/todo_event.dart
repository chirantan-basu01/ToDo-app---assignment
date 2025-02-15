abstract class TodoEvent {}

class LoadTasksEvent extends TodoEvent {}

class AddTaskEvent extends TodoEvent {
  final String task;
  AddTaskEvent(this.task);
}

class RemoveTaskEvent extends TodoEvent {
  final int index;
  RemoveTaskEvent(this.index);
}
