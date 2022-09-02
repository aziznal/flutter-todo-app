import 'dart:math';

import 'package:flutter/material.dart';

import 'package:todo_app/core/todo/todo.model.dart';
import 'package:todo_app/data/todo.repository.dart';
import 'package:todo_app/services/dialog.service.dart';
import 'package:todo_app/services/snackbar.service.dart';
import 'package:todo_app/widgets/todo_list.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoRepository todoRepo = TodoRepository();

  late final List<Todo> todos = todoRepo.getTodos();

  void addNewTodo() {
    final newTodo = Todo(
        id: Random().nextInt(pow(2, 32).toInt() - 1).toString(),
        body: 'New Todo',
        status: TodoStatus.isNotDone);

    todoRepo.createTodo(newTodo);

    SnackbarService.show(context, 'Added new TODO!');

    setState(() {});
  }

  void updateTodo(Todo updatedTodo) {
    SnackbarService.show(context, 'Edit feature coming soon!');

    // todoRepo.updateTodo(updatedTodo);

    // setState(() {});
  }

  void deleteTodo(String deletedTodoId) {
    DialogService.showConfirmDialog(
      context,
      message: 'Delete this todo?',
      confirmButtonLabel: 'Delete',
      cancelButtonLabel: 'Cancel',
    ).then((hasConfirmed) {
      if (hasConfirmed) {
        todoRepo.deleteTodo(deletedTodoId);
        setState(() {});
      }
    });
  }

  void removeAllTodos() {
    final todoIds = todos.toList().map((e) => e.id);

    for (var id in todoIds) {
      todoRepo.deleteTodo(id);
    }

    SnackbarService.show(context, 'Removed All TODOs!');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(),
      body: TodoList(
        todos: todos,
        onEditClicked: (updatedTodo) => updateTodo(updatedTodo),
        onDeleteClicked: (String id) => deleteTodo(id),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTodo,
        child: const Icon(Icons.add),
      ),
    );
  }

  AppBar makeAppBar() {
    return AppBar(
      actions: [
        MaterialButton(
          onPressed: removeAllTodos,
          child: const Icon(
            Icons.delete,
            color: Color.fromARGB(255, 255, 0, 0),
          ),
        )
      ],
    );
  }
}
