import 'package:flutter/material.dart';
import 'package:habitsprout/add_task/widgets/difficulty_container.dart';
import 'package:habitsprout/add_task/widgets/todo_scheduler.dart';
import 'package:habitsprout/core/task_manager/todo_manager.dart';
import 'package:habitsprout/core/widgets/appbar.dart';
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
    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Add Todo', onSubmit, null),
      // appBar: AppBar(
      //   title: Text('Add Todo'),
      //   actions: [
      //     TextButton(
      //         onPressed: () {
      //           onSubmit();
      //         },
      //         child: Text("Add todo"))
      //   ],
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: titleController,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.blueAccent,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),

                  labelText: 'Task Title',
                  border: OutlineInputBorder(), // Optional: Adds a border
                ),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: notesController,
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.blueAccent,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.notes,
                  color: Colors.blue,
                ),

                labelText: 'Notes',
                border: OutlineInputBorder(), // Optional: Adds a border
              ),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
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
      ),
    );
  }
}
