import 'package:flutter/material.dart';
import 'package:habitsprout/core/task_manager/todo_manager.dart';
import 'package:habitsprout/core/widgets/task_action.dart';
import 'package:habitsprout/core/widgets/task_descriptor.dart';
import 'package:habitsprout/todo/model/todo_model.dart';
import 'package:provider/provider.dart';

import '../../core/task_manager/reward_manager.dart';

class TodoCard extends StatelessWidget {
  final TodoModel model;
  const TodoCard({super.key, required this.model});

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
                child: Icon(Icons.square, color: Colors.blueGrey),
                onPressed: () {
                  Provider.of<RewardManager>(context, listen: false)
                      .todoCompletePoints(model);
                  Provider.of<TodoManager>(context, listen: false)
                      .dismissTodo(model);
                },
              ),
              Expanded(
                child: TaskDescriptor(
                    todoId: "aaa",
                    title: model.title,
                    description: model.description),
              ),
            ],
          ),
        ));
  }
}
