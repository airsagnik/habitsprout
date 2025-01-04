import 'package:flutter/material.dart';
import 'package:habitsprout/add_task/todo_addition_form.dart';
import 'package:habitsprout/add_task/widgets/empty_page_with_nav_bar.dart';
import 'package:habitsprout/core/task_manager/habit_manager.dart';
import 'package:habitsprout/core/task_manager/reward_manager.dart';
import 'package:habitsprout/core/task_manager/todo_manager.dart';
import 'package:habitsprout/habits/screens/habit_screen.dart';
import 'package:habitsprout/todo/screens/todo_screen.dart';
import 'package:provider/provider.dart';

import 'add_task/habit_addition_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HabitManager>(create: (_) => HabitManager()),
        ChangeNotifierProvider<RewardManager>(create: (_) => RewardManager()),
        ChangeNotifierProvider<TodoManager>(create: (_) => TodoManager()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainScreen(),
        routes: {
          '/addhabit': (context) => HabitAdditionForm(),
          '/addtodo': (context) => TodoAdditionForm()
        },
      ),
    );
  }
}
