import 'package:flutter/material.dart';
import 'package:habitsprout/todo/widgets/todo_card.dart';

import '../../core/widgets/bottom_nav_bar.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => TodoCard(),
        itemCount: 10,
      ),
    );
  }
}
