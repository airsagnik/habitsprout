import 'package:flutter/material.dart.';
import 'package:habitsprout/core/models/core_models.dart';

class DifficultyContainer extends StatelessWidget {
  final String level;
  final IconData icon;
  final DifficultyLevel assignedDifficulty;
  final DifficultyLevel selectedDifficulty;
  final Function onTap;
  const DifficultyContainer(
      {super.key,
      required this.level,
      required this.icon,
      required this.assignedDifficulty,
      required this.selectedDifficulty,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              //color: Colors.purple.shade200,
              color: selectedDifficulty == assignedDifficulty
                  ? Colors.purple.shade200
                  : Colors.purple,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Icon(icon),
          ),
          SizedBox(
            height: 5,
          ),
          Text(level)
        ],
      ),
    );
  }
}
