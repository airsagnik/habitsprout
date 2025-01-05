import '../../core/models/core_models.dart';

enum HabitType {
  positive,
  negative,
}

extension HabitTypeConverter on String {
  HabitType get habitType {
    switch (this) {
      case 'positive':
        return HabitType.positive;
      default:
        return HabitType.negative;
    }
  }
}

class HabitModel {
  String? id;
  final String title;
  final String? description;
  final HabitType habitType;
  final DifficultyLevel difficultyLevel;

  HabitModel(
      {required this.title,
      this.id,
      this.habitType = HabitType.positive,
      this.difficultyLevel = DifficultyLevel.easy,
      required this.description});
}
