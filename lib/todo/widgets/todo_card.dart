import 'package:flutter/material.dart';
import 'package:habitsprout/core/widgets/task_action.dart';
import 'package:habitsprout/core/widgets/task_descriptor.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key});

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
              SizedBox(width: 5,),
              Expanded(
                child: TaskDescriptor(
                  todoId: "abc",
                  title: ""
                      "Balle Balle",
                  description:
                      'jnjnjnjncjnjncnnjcdnjnwdjncjnsdjncjsdcjjncnjncdnjnjjksnkjnscnasknaskncaskncnkascnkasnnknsknckasnkasn',
                ),
              ),
            ],
          ),
        ));
  }
}
