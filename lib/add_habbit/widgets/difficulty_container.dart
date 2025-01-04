import 'package:flutter/material.dart.';

class DifficultyContainer extends StatelessWidget {
  final String level;
  final IconData icon;
  const DifficultyContainer(
      {super.key, required this.level, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Icon(icon),
        ),
        SizedBox(
          height: 5,
        ),
        Text(level)
      ],
    );
  }
}
