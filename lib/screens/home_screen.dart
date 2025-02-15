import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';

import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../widgets/add_task_dialog.dart';
import '../widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Tasks'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2A2D3E), Color(0xFF1E1E2C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            if (state.tasks.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/animations/empty.json', height: 300),
                    const SizedBox(height: 10),
                    const Text('No tasks yet! Add some to get started.',
                        style: TextStyle(fontSize: 16, color: Colors.white70)),
                  ],
                ),
              );
            }
            return AnimationLimiter(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: TaskTile(
                          task: state.tasks[index],
                          onDelete: () => context
                              .read<TodoBloc>()
                              .add(RemoveTaskEvent(index)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return const Center(
              child: Text('Something went wrong!',
                  style: TextStyle(color: Colors.white)));
        },
      ),

      floatingActionButton: GestureDetector(
        onTap: () => showAddTaskDialog(context),
        child: Container(
          height: 60,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [Color(0xFF4E4F66), Color(0xFF2A2D3E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: const Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, color: Colors.white, size: 26),
                SizedBox(width: 8),
                Text(
                  "New Task",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
