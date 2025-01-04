import '../../core/models/core_models.dart';

enum HabitType {
  positive,
  negative,
}


class HabitModel {
  final String title;
  final String? description;
  final HabitType habitType;
  final DifficultyLevel difficultyLevel;

  HabitModel(
      {required this.title,
      this.habitType = HabitType.positive,
      this.difficultyLevel = DifficultyLevel.easy,
      required this.description});
}
