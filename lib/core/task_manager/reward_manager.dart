import 'package:flutter/cupertino.dart';
import 'package:habitsprout/core/models/core_models.dart';
import 'package:habitsprout/habits/model/habit_model.dart';
import 'package:habitsprout/todo/model/todo_model.dart';

import '../../rewards/model/reward_model.dart';

class RewardManager extends ChangeNotifier {
  double habitoCoins = 0;
  final List<Map<String, dynamic>> pokemonData = [
    {
      "id": 1,
      "name": "Pikachu",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
      "price": 50
    },
    {
      "id": 2,
      "name": "Charmander",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
      "price": 300
    },
    {
      "id": 3,
      "name": "Bulbasaur",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
      "price": 250
    },
    {
      "id": 4,
      "name": "Squirtle",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png",
      "price": 270
    },
    {
      "id": 5,
      "name": "Jigglypuff",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/39.png",
      "price": 150
    },
    {
      "id": 6,
      "name": "Eevee",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/133.png",
      "price": 350
    },
    {
      "id": 7,
      "name": "Snorlax",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/143.png",
      "price": 500
    },
    {
      "id": 8,
      "name": "Gengar",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/94.png",
      "price": 400
    },
    {
      "id": 9,
      "name": "Psyduck",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/54.png",
      "price": 180
    },
    {
      "id": 10,
      "name": "Meowth",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/52.png",
      "price": 120
    },
    {
      "id": 11,
      "name": "Articuno",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/144.png",
      "price": 1000
    },
    {
      "id": 12,
      "name": "Zapdos",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/145.png",
      "price": 1100
    },
    {
      "id": 13,
      "name": "Moltres",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/146.png",
      "price": 1150
    },
    {
      "id": 14,
      "name": "Dragonite",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/149.png",
      "price": 1500
    },
    {
      "id": 15,
      "name": "Mewtwo",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png",
      "price": 2000
    },
    {
      "id": 16,
      "name": "Tyranitar",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/248.png",
      "price": 1800
    },
    {
      "id": 17,
      "name": "Lucario",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/448.png",
      "price": 1300
    },
    {
      "id": 18,
      "name": "Rayquaza",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/384.png",
      "price": 2200
    },
    {
      "id": 19,
      "name": "Garchomp",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/445.png",
      "price": 1400
    },
    {
      "id": 20,
      "name": "Sylveon",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/700.png",
      "price": 1250
    }

    // Add more Pokémon if needed
  ];
  List<RewardModel> reward = [];

  List<RewardModel> collectedReward = [];

  RewardManager() {
    for (var item in pokemonData) {
      reward.add(RewardModel(
          id: item['id'].toString(),
          rewardName: item['name'],
          price: item['price'] * 1.0,
          imageUrl: item['image']));
    }
  }

  void addPositiveHabitCoins(HabitModel habit) {
    habitoCoins =
        habitoCoins + (5 * getDifficultyOffset(habit.difficultyLevel));
    notifyListeners();
  }

  void removeNegativeHabitCoins(HabitModel habit) {
    habitoCoins =
        habitoCoins - (5 * getDifficultyOffset(habit.difficultyLevel));
    notifyListeners();
  }

  void todoCompletePoints(TodoModel model) {
    habitoCoins =
        habitoCoins + (10 * getDifficultyOffset(model.difficultyLevel));
    notifyListeners();
  }

  void collectRewards(RewardModel reward) {
    collectedReward.add(reward);
    habitoCoins = habitoCoins - reward.price;
    notifyListeners();
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
