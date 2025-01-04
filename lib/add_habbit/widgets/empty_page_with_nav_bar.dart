import 'package:flutter/material.dart';
import 'package:habitsprout/habits/screens/habit_screen.dart';
import 'package:habitsprout/todo/screens/todo_screen.dart';

import '../add_form.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Keys for nested navigation
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _onTap(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  // Bottom Navigation Bar pages
  final List<String> _routes = [
    '/',
    '/todo',
    '/addTask',
  ];

  // Widget builder for the nested navigation
  Widget _buildOffstageNavigator(int index) {
    return Offstage(
      offstage: _currentIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        initialRoute: _routes[index],
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext context) => HabitScreen();
              break;
            case '/todo':
              builder = (BuildContext context) => TodoScreen();
              break;
            case '/addTask':
              builder = (BuildContext context) => TaskAdditionForm();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: List.generate(
          _routes.length,
          (index) => _buildOffstageNavigator(index),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Habits'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Todo'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Profile'),
        ],
      ),
    );
  }
}

