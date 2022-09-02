import 'package:flutter/material.dart';

import 'package:todo_app/core/todo/todo.model.dart';
import 'package:todo_app/services/dialog.service.dart';
import 'package:todo_app/services/snackbar.service.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  final void Function() onEditClicked;
  final void Function() onDeleteClicked;

  const TodoWidget({
    Key? key,
    required this.todo,
    required this.onEditClicked,
    required this.onDeleteClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 236, 236, 236),
        boxShadow: [
          BoxShadow(blurRadius: 5, color: Color.fromARGB(255, 137, 137, 137))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(todo.body),
            const Spacer(),
            _EditButton(onPressed: onEditClicked),
            _DeleteButton(onPressed: onDeleteClicked),
          ],
        ),
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(0, 0, 0, 0),
      child: IconButton(
        onPressed: () => onPressed(),
        icon: const Icon(
          Icons.delete,
          color: Colors.redAccent,
        ),
        splashColor: const Color.fromARGB(255, 144, 144, 144),
        padding: EdgeInsets.zero,
      ),
    );
  }
}

class _EditButton extends StatelessWidget {
  const _EditButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(0, 0, 0, 0),
      child: IconButton(
        onPressed: () => onPressed(),
        icon: const Icon(
          Icons.edit,
        ),
        padding: EdgeInsets.zero,
        splashColor: const Color.fromARGB(255, 144, 144, 144),
      ),
    );
  }
}
