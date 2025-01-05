import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habitsprout/add_task/todo_addition_form.dart';
import 'package:habitsprout/add_task/widgets/empty_page_with_nav_bar.dart';
import 'package:habitsprout/core/task_manager/auth_manager.dart';
import 'package:habitsprout/core/task_manager/habit_manager.dart';
import 'package:habitsprout/core/task_manager/reward_manager.dart';
import 'package:habitsprout/core/task_manager/todo_manager.dart';
import 'package:habitsprout/profile/login_signup.dart';
import 'package:provider/provider.dart';

import 'add_task/habit_addition_form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ChangeNotifierProvider<Authentication>(create: (_) => Authentication()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
        routes: {
          '/addhabit': (context) => HabitAdditionForm(),
          '/addtodo': (context) => TodoAdditionForm(),
          '/login' : (context) => AuthScreen(),
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.uid.isNotEmpty) {
            return MainScreen();
          } else {
            return AuthScreen();
          }
        },
      ),
    );
  }
}

