import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:habitsprout/core/models/core_models.dart';
import 'package:habitsprout/todo/model/todo_model.dart';

class TodoManager extends ChangeNotifier {
  List<TodoModel> todo = [];
  bool isLoading = false;

  Future<void> addTodo(TodoModel model) async {
    try {
      final modelWithId = await updateToDoOnDb(model);
      todo.add(modelWithId);
      notifyListeners();
    } catch (error) {
      throw Exception();
    }
  }

  Future<TodoModel> updateToDoOnDb(TodoModel model) async {
    final db = FirebaseFirestore.instance;
    final response = await db
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('todos')
        .add({
      'title': model.title,
      'description': model.description,
      'difficulty': model.difficultyLevel.name,
      'due-date': model.dueDate,
    });

    model.id = response.id;
    return model;
  }

  Future<void> fetchTodo() async {
    if (todo.isNotEmpty) {
      return;
    }
    isLoading = true;
    todo = [];

    final db = FirebaseFirestore.instance;
    final response = await db
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('todos')
        .get();

    for (var val in response.docs) {
      final data = val.data();
      final model = TodoModel(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        dueDate: (data['due-date'] as Timestamp).toDate(),
        difficultyLevel: (data['difficulty'] as String).difficultyType,
      );

      todo.add(model);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> removeTodoFromDb(String id) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('todos')
        .doc(id)
        .delete();
  }

  void dismissTodo(TodoModel model) {
    todo.remove(model);
    removeTodoFromDb(model.id ?? '');
    notifyListeners();
  }
}
