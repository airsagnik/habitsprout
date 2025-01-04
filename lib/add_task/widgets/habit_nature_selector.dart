import 'package:flutter/material.dart.';
import 'package:habitsprout/habits/model/habit_model.dart';

class HabitNatureSelector extends StatelessWidget {
  final String label;
  final IconData icon;
  final HabitType selectedType;
  final HabitType assignedType;
  final Function onTap;
  const HabitNatureSelector(
      {super.key,
      required this.label,
      required this.icon,
      required this.assignedType,
      required this.selectedType,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: selectedType == assignedType
                ? Colors.purple.shade200
                : Colors.purple,
            child: Icon(icon,color: Colors.white,),
          ),
          SizedBox(
            height: 5,
          ),
          Text(label),
        ],
      ),
    );
  }
}
