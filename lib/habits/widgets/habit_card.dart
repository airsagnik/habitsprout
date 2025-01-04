import 'package:flutter/material.dart.';
import 'package:habitsprout/habits/model/habit_model.dart';

import '../../core/widgets/task_action.dart';
import '../../core/widgets/task_descriptor.dart';

class HabitCard extends StatelessWidget {
  final HabitModel model;

  const HabitCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TaskAction(
                color: Colors.yellow,
                applyBorderRadiusOnLeft: true,
                child: Icon(Icons.add),
                onPressed: () {},
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: TaskDescriptor(
                    todoId: 'aaa',
                    title: model.title,
                    description: model.description),
              ),
              TaskAction(
                color: Colors.yellow,
                child: Icon(Icons.home_mini_sharp),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
