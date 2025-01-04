import 'package:flutter/material.dart';
import 'package:habitsprout/core/task_manager/reward_manager.dart';
import 'package:habitsprout/core/task_manager/todo_manager.dart';
import 'package:habitsprout/todo/widgets/todo_card.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/bottom_nav_bar.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pushNamed(
                "/addtask",
              );
            },
            child: Text("add Todo"),
          )
        ],
      ),
      body: Consumer<TodoManager>(
        builder: (context, data, child) => data.todo.isEmpty
            ? Center(
                child: Text("No todo added"),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => TodoCard(),
                itemCount: 10,
              ),
      ),
    );
  }
}
