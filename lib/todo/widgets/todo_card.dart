import 'package:flutter/material.dart';
import 'package:habitsprout/core/widgets/task_action.dart';
import 'package:habitsprout/core/widgets/task_descriptor.dart';
import 'package:habitsprout/todo/model/todo_model.dart';

class TodoCard extends StatelessWidget {
  final TodoModel model;
  const TodoCard({super.key, required this.model});

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
                child: Icon(Icons.square),
                onPressed: () {},
              ),
              SizedBox(
                width: 5,
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
