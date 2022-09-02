import 'package:flutter/material.dart';

import 'package:todo_app/core/todo.model.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(todo.id),
          const Padding(
            padding: EdgeInsets.all(12),
          ),
          Text(todo.body),
        ],
      ),
    );
  }
}
