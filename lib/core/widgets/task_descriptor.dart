import 'package:flutter/material.dart';

class TaskDescriptor extends StatelessWidget {
  final String todoId;
  final String title;
  final String? description;
  const TaskDescriptor(
      {super.key, required this.todoId, required this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      color: Colors.black54,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            softWrap: true,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          if (description != null)
            Text(
              description!,
              softWrap: true,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white54,
              ),
            ),
        ],
      ),
    );
  }
}
