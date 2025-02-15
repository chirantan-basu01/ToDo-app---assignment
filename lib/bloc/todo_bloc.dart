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
    on<EditTaskEvent>(_onEditTask);
  }

  Future<void> _onLoadTasks(
      LoadTasksEvent event, Emitter<TodoState> emit) async {
    try {
      final tasks = await taskRepository.getAllTasks();
      emit(TodoLoaded(tasks));
    } catch (e) {
      emit(TodoError("Failed to load tasks."));
    }
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<TodoState> emit) async {
    try {
      await taskRepository.addTask(event.addTask);
      add(LoadTasksEvent());
    } catch (e) {
      emit(TodoError("Failed to add tasks."));
    }
  }

  Future<void> _onRemoveTask(
      RemoveTaskEvent event, Emitter<TodoState> emit) async {
    try {
      await taskRepository.removeTask(event.removeTask);
      add(LoadTasksEvent());
    } catch (e) {
      emit(TodoError("Failed to remove tasks."));
    }
  }

  Future<void> _onEditTask(EditTaskEvent event, Emitter<TodoState> emit) async {
    try {
      await taskRepository.updateTask(event.updatedTask);
      final updatedTasks = (state as TodoLoaded).tasks.map((task) {
        return task.id == event.updatedTask.id ? event.updatedTask : task;
      }).toList();
      emit(TodoLoaded(updatedTasks));
    } catch (e) {
      emit(TodoError("Failed to update task."));
    }
  }
}
