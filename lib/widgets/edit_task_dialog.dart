import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../database/task.dart';

void showEditTaskDialog(BuildContext context, Task task) {
  final TextEditingController taskController =
  TextEditingController(text: task.title);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF2A2D3E),
        title: const Text('Edit Task', style: TextStyle(color: Colors.white)),
        content: TextField(
          controller: taskController,
          decoration: const InputDecoration(hintText: 'Update task'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              if (taskController.text.isNotEmpty) {
                Task updatedTask = task.copyWith(title: taskController.text);
                context.read<TodoBloc>().add(EditTaskEvent(updatedTask));
                Navigator.pop(context);
              }
            },
            child: const Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    },
  );
}
