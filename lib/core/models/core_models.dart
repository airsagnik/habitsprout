enum DifficultyLevel { trivial, easy, medium, hard }

extension DifficultyLevelConverter on String {
  DifficultyLevel get difficultyType {
    switch (this) {
      case 'trivial':
        return DifficultyLevel.trivial;
      case 'easy':
        return DifficultyLevel.easy;
      case 'medium':
        return DifficultyLevel.medium;
      default:
        return DifficultyLevel.hard;
    }
  }
}
