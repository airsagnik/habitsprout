import 'package:flutter/cupertino.dart';
import 'package:habitsprout/todo/model/todo_model.dart';

class TodoManager extends ChangeNotifier {
  List<TodoModel> todo = [];

  void addTodo(TodoModel model) {
    todo.add(model);
    notifyListeners();
  }

  void fetchTodo() {}

  void dismissTodo(TodoModel model) {
    todo.remove(model);
    notifyListeners();
  }
}
