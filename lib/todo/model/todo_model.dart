import 'package:habitsprout/core/models/core_models.dart';

class TodoModel {
  String title;
  String? description;
  DifficultyLevel difficultyLevel;
  DateTime? dueDate;
  List<DateTime>? dateTime;

  TodoModel(
      {required this.title,
      this.description,
      this.dateTime,
      this.dueDate,
      this.difficultyLevel = DifficultyLevel.easy});
}
