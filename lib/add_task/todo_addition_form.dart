import 'package:flutter/material.dart';
import 'package:habitsprout/add_task/widgets/difficulty_container.dart';
import 'package:habitsprout/add_task/widgets/todo_scheduler.dart';
import 'package:habitsprout/core/task_manager/todo_manager.dart';
import 'package:habitsprout/todo/model/todo_model.dart';
import 'package:provider/provider.dart';

import '../core/models/core_models.dart';

class TodoAdditionForm extends StatefulWidget {
  const TodoAdditionForm({super.key});

  @override
  State<TodoAdditionForm> createState() => _TodoAdditionFormState();
}

class _TodoAdditionFormState extends State<TodoAdditionForm> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();

  final ValueNotifier<DifficultyLevel> difficulty =
      ValueNotifier<DifficultyLevel>(DifficultyLevel.easy);

  void onSubmit() {
    final difficultyType = difficulty.value;
    final model = TodoModel(
        title: titleController.text,
        description: notesController.text,
        dueDate: DateTime.tryParse(dateTimeController.text),
        difficultyLevel: difficultyType);

    Provider.of<TodoManager>(context, listen: false).addTodo(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
        actions: [
          TextButton(
              onPressed: () {
                onSubmit();
              },
              child: Text("Add todo"))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Task Title',
              border: OutlineInputBorder(), // Optional: Adds a border
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: notesController,
            decoration: InputDecoration(
              labelText: 'Notes',
              border: OutlineInputBorder(), // Optional: Adds a border
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ValueListenableBuilder(
            valueListenable: difficulty,
            builder: (context, data, child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DifficultyContainer(
                  level: 'Trivial',
                  icon: Icons.ac_unit,
                  assignedDifficulty: DifficultyLevel.trivial,
                  selectedDifficulty: data,
                  onTap: () {
                    difficulty.value = DifficultyLevel.trivial;
                  },
                ),
                DifficultyContainer(
                  level: 'Easy',
                  icon: Icons.verified_outlined,
                  assignedDifficulty: DifficultyLevel.easy,
                  selectedDifficulty: data,
                  onTap: () {
                    difficulty.value = DifficultyLevel.easy;
                  },
                ),
                DifficultyContainer(
                  level: 'Medium',
                  icon: Icons.brightness_medium,
                  assignedDifficulty: DifficultyLevel.medium,
                  selectedDifficulty: data,
                  onTap: () {
                    difficulty.value = DifficultyLevel.medium;
                  },
                ),
                DifficultyContainer(
                  level: 'Hard',
                  icon: Icons.alarm,
                  assignedDifficulty: DifficultyLevel.hard,
                  selectedDifficulty: data,
                  onTap: () {
                    difficulty.value = DifficultyLevel.hard;
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TodoScheduler(
            dateTimeController: dateTimeController,
          )
        ],
      ),
    );
  }
}
