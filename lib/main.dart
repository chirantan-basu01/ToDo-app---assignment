import 'package:assignment_app/repositories/task_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo_bloc.dart';
import 'bloc/todo_event.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoBloc(TaskRepository())..add(LoadTasksEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo App',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF1E1E2C),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF2A2D3E),
            elevation: 5,
            titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            centerTitle: true,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
