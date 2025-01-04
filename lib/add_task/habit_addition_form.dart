import 'package:flutter/material.dart';
import 'package:habitsprout/add_task/widgets/difficulty_container.dart';
import 'package:habitsprout/add_task/widgets/habit_nature_selector.dart';
import 'package:habitsprout/core/models/core_models.dart';
import 'package:habitsprout/core/task_manager/habit_manager.dart';
import 'package:habitsprout/habits/model/habit_model.dart';
import 'package:provider/provider.dart';

class HabitAdditionForm extends StatefulWidget {
  const HabitAdditionForm({super.key});

  @override
  State<HabitAdditionForm> createState() => _HabitAdditionFormState();
}

class _HabitAdditionFormState extends State<HabitAdditionForm> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  final ValueNotifier<HabitType> habitNature =
      ValueNotifier<HabitType>(HabitType.negative);

  final ValueNotifier<DifficultyLevel> difficulty =
      ValueNotifier<DifficultyLevel>(DifficultyLevel.easy);

  void onSubmit() {
    final habitNatureType = habitNature.value;
    final difficultyType = difficulty.value;
    final model = HabitModel(
        title: titleController.text,
        description: notesController.text,
        habitType: habitNatureType,
        difficultyLevel: difficultyType);

    Provider.of<HabitManager>(context, listen: false).addHabits(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
        actions: [
          TextButton(
              onPressed: () {
                onSubmit();
              },
              child: Text("add Habit"))
        ],
      ),
      body: Form(
        key: formKey,
        child: Column(
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
            ValueListenableBuilder<HabitType>(
              builder: (context, data, child) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HabitNatureSelector(
                    label: 'positive',
                    icon: Icons.add,
                    assignedType: HabitType.positive,
                    selectedType: data,
                    onTap: () {
                      habitNature.value = HabitType.positive;
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  HabitNatureSelector(
                    label: 'negative',
                    icon: Icons.accessibility,
                    assignedType: HabitType.negative,
                    selectedType: data,
                    onTap: () {
                      habitNature.value = HabitType.negative;
                    },
                  ),
                ],
              ),
              valueListenable: habitNature,
            ),
            SizedBox(
              height: 16,
            ),
            ValueListenableBuilder<DifficultyLevel>(
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
            )
          ],
        ),
      ),
    );
  }
}