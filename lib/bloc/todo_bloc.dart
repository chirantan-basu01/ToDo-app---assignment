import 'package:assignment_app/bloc/todo_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../database/task.dart';
import '../repositories/task_repository.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TaskRepository taskRepository;

  TodoBloc(this.taskRepository) : super(TodoInitial()) {
    on<LoadTasksEvent>(_onLoadTasks);
    on<AddTaskEvent>(_onAddTask);
    on<RemoveTaskEvent>(_onRemoveTask);
  }

  Future<void> _onLoadTasks(
      LoadTasksEvent event, Emitter<TodoState> emit) async {
    final tasks = await taskRepository.getAllTasks();
    emit(TodoLoaded(tasks));
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<TodoState> emit) async {
    await taskRepository.addTask(event.task);
    add(LoadTasksEvent());
  }

  Future<void> _onRemoveTask(
      RemoveTaskEvent event, Emitter<TodoState> emit) async {
    await taskRepository.removeTask(event.task);
    add(LoadTasksEvent());
  }
}
