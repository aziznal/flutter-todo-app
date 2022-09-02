import 'package:flutter/material.dart';

import 'package:todo_app/core/todo/todo.model.dart';
import 'package:todo_app/widgets/todo.widget.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.todos,
    required this.onEditClicked,
    required this.onDeleteClicked,
  }) : super(key: key);

  final List<Todo> todos;

  final void Function(Todo updatedTodo) onEditClicked;
  final void Function(String deletedTodoId) onDeleteClicked;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: TodoWidget(
            todo: todos[index],
            onDeleteClicked: () => onDeleteClicked(todos[index].id),
            onEditClicked: () => onEditClicked(todos[index]),
          ),
        );
      },
      itemCount: todos.length,
      padding: const EdgeInsets.all(8),
    );
  }
}
