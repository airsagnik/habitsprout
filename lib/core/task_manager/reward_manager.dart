import 'package:flutter/cupertino.dart';
import 'package:habitsprout/core/models/core_models.dart';
import 'package:habitsprout/habits/model/habit_model.dart';
import 'package:habitsprout/todo/model/todo_model.dart';

class RewardManager extends ChangeNotifier {
  double habitoCoins = 0;

  void addPositiveHabitCoins(HabitModel habit) {
    habitoCoins =
        habitoCoins + (5 * getDifficultyOffset(habit.difficultyLevel));
  }

  void removeNegativeHabitCoins(HabitModel habit) {
    habitoCoins =
        habitoCoins - (5 * getDifficultyOffset(habit.difficultyLevel));
  }

  void todoCompletePoints(TodoModel model) {
    habitoCoins =
        habitoCoins + (10 * getDifficultyOffset(model.difficultyLevel));
  }

  double getDifficultyOffset(DifficultyLevel difficultyLevel) {
    switch (difficultyLevel) {
      case DifficultyLevel.trivial:
        return 1;
      case DifficultyLevel.easy:
        return 1.5;
      case DifficultyLevel.medium:
        return 3.5;
      case DifficultyLevel.hard:
        return 4;
    }
  }
}
