import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';

void showAddTaskDialog(BuildContext context) {
  final TextEditingController taskController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF2A2D3E),
        title: const Text('Add Task', style: TextStyle(color: Colors.white)),
        content: TextField(
            controller: taskController,
            decoration: const InputDecoration(hintText: 'Enter task')),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.white))),
          TextButton(
            onPressed: () {
              if (taskController.text.isNotEmpty) {
                context.read<TodoBloc>().add(AddTaskEvent(taskController.text));
                Navigator.pop(context);
              }
            },
            child: const Text('Add', style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    },
  );
}
