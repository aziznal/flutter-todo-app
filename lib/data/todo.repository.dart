import 'package:todo_app/core/todo/todo.model.dart';

abstract class TodoRepository {
  factory TodoRepository() => InMemoryTodoRepository();

  List<Todo> getTodos();
  Todo? getTodoById(String id);
  void createTodo(Todo todo);
  void updateTodo(Todo todo);
  void deleteTodo(String id);
}

class InMemoryTodoRepository implements TodoRepository {
  final List<Todo> todos = [
    Todo(id: '1', body: 'First Todo', status: TodoStatus.isNotDone)
  ];

  @override
  void createTodo(Todo todo) {
    todos.add(todo);
  }

  @override
  void deleteTodo(String id) {
    todos.removeWhere((todo) => todo.id == id);
  }

  @override
  Todo getTodoById(String id) {
    return todos.singleWhere((todo) => todo.id == id);
  }

  @override
  List<Todo> getTodos() {
    return todos;
  }

  @override
  void updateTodo(Todo updatedTodo) {
    final updatedTodoIndex =
        todos.indexWhere((element) => element.id == updatedTodo.id);

    todos[updatedTodoIndex] = updatedTodo;
  }
}
