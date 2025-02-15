import 'package:assignment_app/bloc/todo_event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/task_repository.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TaskRepository taskRepository;

  TodoBloc(this.taskRepository) : super(TodoInitial()) {
    on<LoadTasksEvent>((event, emit) {
      emit(TodoLoaded(taskRepository.getTasks()));
    });
    on<AddTaskEvent>((event, emit) {
      taskRepository.addTask(event.task);
      emit(TodoLoaded(taskRepository.getTasks()));
    });
    on<RemoveTaskEvent>((event, emit) {
      taskRepository.removeTask(event.index);
      emit(TodoLoaded(taskRepository.getTasks()));
    });
  }
}
