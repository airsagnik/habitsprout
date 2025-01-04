import 'package:flutter/material.dart';
import 'package:habitsprout/add_habbit/widgets/difficulty_container.dart';
import 'package:habitsprout/add_habbit/widgets/habit_nature_selector.dart';

class TaskAdditionForm extends StatelessWidget {
  const TaskAdditionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Column(
        children: [
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Task Title',
              border: OutlineInputBorder(), // Optional: Adds a border
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Notes',
              border: OutlineInputBorder(), // Optional: Adds a border
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HabitNatureSelector(label: 'positive', icon: Icons.add),
              SizedBox(
                width: 10,
              ),
              HabitNatureSelector(label: 'negative', icon: Icons.accessibility),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DifficultyContainer(level: 'Trivial', icon: Icons.ac_unit),
              DifficultyContainer(level: 'Easy', icon: Icons.verified_outlined),
              DifficultyContainer(
                  level: 'Medium', icon: Icons.brightness_medium),
              DifficultyContainer(level: 'Hard', icon: Icons.alarm)
            ],
          )
        ],
      ),
    );
  }
}
