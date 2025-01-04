import 'package:flutter/material.dart.';

class HabitNatureSelector extends StatelessWidget {
  final String label;
  final IconData icon;
  const HabitNatureSelector(
      {super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: Icon(icon),
        ),
        SizedBox(
          height: 5,
        ),
        Text(label),
      ],
    );
  }
}
