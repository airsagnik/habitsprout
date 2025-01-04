import 'package:flutter/material.dart.';

import '../../core/widgets/task_action.dart';
import '../../core/widgets/task_descriptor.dart';

class HabitCard extends StatelessWidget {
  const HabitCard({super.key});

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
                  todoId: "abc",
                  title: ""
                      "Balle Balle",
                  description:
                      'jnjnjnjncjnjncnnjcdnjnwdjncjnsdjncjsdcjjncnjncdnjnjjksnkjnscnasknaskncaskncnkascnkasnnknsknckasnkasn',
                ),
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
