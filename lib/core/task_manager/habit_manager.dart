import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habitsprout/core/models/core_models.dart';
import 'package:habitsprout/habits/model/habit_model.dart';

class HabitManager extends ChangeNotifier {
  List<HabitModel> habits = [];
  bool isLoading = false;

  Future<void> fetchHabits() async {
    if (habits.isNotEmpty) {
      return;
    }
    isLoading = true;
    habits = [];

    final db = FirebaseFirestore.instance;
    final response = await db
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('habits')
        .get();

    for (var val in response.docs) {
      final data = val.data();
      final model = HabitModel(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        habitType: (data['habitType'] as String).habitType,
        difficultyLevel: (data['difficulty'] as String).difficultyType,
      );

      habits.add(model);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addHabits(HabitModel model) async {
    try {
      final modelWithId = await updateHabitsOnDb(model);
      habits.add(modelWithId);
      notifyListeners();
    } catch (error) {
      throw Exception();
    }
  }

  Future<HabitModel> updateHabitsOnDb(HabitModel model) async {
    final db = FirebaseFirestore.instance;
    final response = await db
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('habits')
        .add({
      'title': model.title,
      'description': model.description,
      'habitType': model.habitType.name,
      'difficulty': model.difficultyLevel.name
    });

    model.id = response.id;
    return model;
  }

  void dismissHabit() {}
}
