part of 'todo_bloc.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Task> tasks;
  TodoLoaded(this.tasks);
}
