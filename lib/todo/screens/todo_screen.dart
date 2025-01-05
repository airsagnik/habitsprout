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
    Provider.of<TodoManager>(context, listen: false).fetchTodo();

    return Scaffold(
      appBar: getAppBar(
        'Add Todo',
        () {
          Navigator.of(context, rootNavigator: true).pushNamed("/addtodo");
        },
        CoinDisplay(),
      ),
      body: Consumer<TodoManager>(
        builder: (context, data, child) => data.isLoading
            ? Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              )
            : data.todo.isEmpty
                ? Center(
                    child: Text("No todo added"),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => TodoCard(
                        model: data.todo[index],
                      ),
                      itemCount: data.todo.length,
                    ),
                  ),
      ),
    );
  }
}
