import 'package:flutter/material.dart';
import 'package:habitsprout/core/widgets/bottom_nav_bar.dart';

import '../widgets/habit_card.dart';

class HabitScreen extends StatelessWidget {
  const HabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => HabitCard(),
        itemCount: 10,
      ),
    );
  }
}
