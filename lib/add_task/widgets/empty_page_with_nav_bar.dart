import 'package:flutter/material.dart';
import 'package:habitsprout/habits/screens/habit_screen.dart';
import 'package:habitsprout/profile/profile_screen.dart';
import 'package:habitsprout/todo/screens/todo_screen.dart';

import '../../rewards/screen/reward_screen.dart';
import '../habit_addition_form.dart';

class MainScreen extends StatefulWidget {
  final int? index;
  const MainScreen({super.key, this.index});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = widget.index ?? 0;
    super.initState();
  }

  // Keys for nested navigation
  final List<Widget> _pages = [
    HabitScreen(),
    TodoScreen(),
    PokemonStorePage(),
    ProfilePage()
  ];

  // Navigate and replace current route
  void _navigateToPage(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _onTap(int index) {
    if (_currentIndex != index) {}
  }

  // Bottom Navigation Bar pages
  final List<String> _routes = [
    '/',
    '/todo',
  ];

  // Widget builder for the nested navigation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // This is all you need!
        currentIndex: _currentIndex,
        onTap: (index) {
          _navigateToPage(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Habits'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Todo'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Reward'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
