import 'package:flutter/material.dart';

class TaskDescriptor extends StatelessWidget {
  final String todoId;
  final String title;
  final String? description;
  const TaskDescriptor(
      {super.key, required this.todoId, required this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          softWrap: true,
        ),
        if (description != null)
          Text(
            description!,
            softWrap: true,
          ),
      ],
    );
  }
}
