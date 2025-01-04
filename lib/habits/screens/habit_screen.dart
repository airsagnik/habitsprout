import 'package:flutter/material.dart';
import 'package:habitsprout/core/task_manager/habit_manager.dart';
import 'package:habitsprout/core/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import '../widgets/habit_card.dart';

class HabitScreen extends StatelessWidget {
  const HabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habits'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pushNamed(
                "/addhabit",
              );
            },
            child: Text("add habit"),
          )
        ],
      ),
      body: Consumer<HabitManager>(
        builder: (context, data, child) => data.habits.isEmpty
            ? Center(
                child: Text("No habits added"),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    HabitCard(model: data.habits[index]),
                itemCount: data.habits.length,
              ),
      ),
    );
  }
}
