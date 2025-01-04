import 'package:flutter/material.dart';
import 'package:habitsprout/core/task_manager/reward_manager.dart';
import 'package:habitsprout/core/task_manager/todo_manager.dart';
import 'package:habitsprout/core/widgets/appbar.dart';
import 'package:habitsprout/rewards/widgets/coin_display.dart';
import 'package:habitsprout/todo/widgets/todo_card.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/bottom_nav_bar.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        'Add Todo',
        () {
          Navigator.of(context, rootNavigator: true).pushNamed("/addtodo");
        },
        CoinDisplay(),
      ),
      body: Consumer<TodoManager>(
        builder: (context, data, child) => data.todo.isEmpty
            ? Center(
                child: Text("No todo added"),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => TodoCard(
                  model: data.todo[index],
                ),
                itemCount: data.todo.length,
              ),
      ),
    );
  }
}
