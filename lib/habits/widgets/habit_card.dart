import 'package:flutter/material.dart.';
import 'package:habitsprout/core/task_manager/reward_manager.dart';
import 'package:habitsprout/habits/model/habit_model.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/task_action.dart';
import '../../core/widgets/task_descriptor.dart';

class HabitCard extends StatelessWidget {
  final HabitModel model;

  const HabitCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TaskAction(
                color: Colors.orangeAccent,
                applyBorderRadiusOnLeft: true,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (model.habitType == HabitType.positive) {
                    Provider.of<RewardManager>(context,listen: false)
                        .addPositiveHabitCoins(model);
                  }
                },
              ),
              Expanded(
                child: TaskDescriptor(
                    todoId: 'aaa',
                    title: model.title,
                    description: model.description),
              ),
              TaskAction(
                color: Colors.orangeAccent,
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (model.habitType == HabitType.negative) {
                    Provider.of<RewardManager>(context,listen: false)
                        .removeNegativeHabitCoins(model);
                  }
                },
              ),
            ],
          ),
        ));
  }
}
