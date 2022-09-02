import 'dart:math';

import 'package:flutter/material.dart';

import 'package:todo_app/core/todo/todo.model.dart';
import 'package:todo_app/core/todo/usecases/create-todo.usecase.dart';
import 'package:todo_app/core/todo/usecases/delete-all-todos.usecase.dart';
import 'package:todo_app/core/todo/usecases/delete-todo.usecase.dart';
import 'package:todo_app/core/todo/usecases/get-all-todos.usecase.dart';
import 'package:todo_app/presentation/services/dialog.service.dart';
import 'package:todo_app/presentation/services/snackbar.service.dart';
import 'package:todo_app/presentation/widgets/todo_list.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = [];

  _HomePageState() {
    GetAllTodosUsecase()
        .execute()
        .then((fetchedTodos) => setState((() => todos = fetchedTodos)));
  }

  void addNewTodo() {
    final newTodo = Todo(
      id: Random().nextInt(pow(2, 32).toInt() - 1).toString(),
      body: 'New Todo',
      status: TodoStatus.isNotDone,
    );

    CreateTodoUsecase().execute(newTodo).then((_) {
      SnackbarService.show(context, 'Added new TODO!');
      setState(() {});
    });
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
      if (!hasConfirmed) return;

      DeleteTodoUsecase().execute(deletedTodoId).then((_) {
        setState(() {});
      });
    });
  }

  void removeAllTodos() {
    DeleteAllTodosUsecase().execute().then((value) {
      SnackbarService.show(context, 'Removed All TODOs!');
      setState(() {});
    });
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
