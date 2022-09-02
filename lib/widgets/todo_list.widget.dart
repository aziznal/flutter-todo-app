import 'package:flutter/material.dart';

import 'package:todo_app/core/todo.model.dart';
import 'package:todo_app/widgets/todo.widget.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.todos,
  }) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TodoWidget(todo: todos[index]);
      },
      itemCount: todos.length,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
    );
  }
}
