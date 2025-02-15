import 'package:assignment_app/repositories/task_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/todo_bloc.dart';
import 'bloc/todo_event.dart';
import 'database/app_database.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final taskRepository = TaskRepository(database.taskDao);

  runApp(MyApp(taskRepository: taskRepository));
}

class MyApp extends StatelessWidget {
  final TaskRepository taskRepository;


  const MyApp({super.key, required this.taskRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoBloc(taskRepository)..add(LoadTasksEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo App',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF1E1E2C),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF2A2D3E),
            elevation: 5,
            titleTextStyle: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            centerTitle: true,
          ),
          textTheme: TextTheme(
            bodyLarge: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyMedium: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
