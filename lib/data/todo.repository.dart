import 'package:todo_app/core/todo/todo.model.dart';

/// Stores Todos and allows for their retrieval
abstract class TodoRepository {
  factory TodoRepository() => _InMemoryTodoRepository();

  
  /// Returns a list of all available todos
  Future<List<Todo>> getTodos();
  
  /// Returns a specific todo using its id. Returns null if no todo matches given id.
  Future<Todo?> getTodoById(String id);
  
  /// Stores the given todo
  Future<void> createTodo(Todo todo);
  
  /// Updates todo that has same id as given todo with the info in the given todo
  Future<void> updateTodo(Todo todo);
  
  /// Deletes the todo that matches the given id
  Future<void> deleteTodo(String id);
}

/// Singleton in-memory repository for storing and retrieving todos
class _InMemoryTodoRepository implements TodoRepository {
  static final _InMemoryTodoRepository _instance = _InMemoryTodoRepository._();

  factory _InMemoryTodoRepository() {
    return _instance;
  }

  _InMemoryTodoRepository._();

  final List<Todo> todos = [
    Todo(id: '1', body: 'First Todo', status: TodoStatus.isNotDone)
  ];

  @override
  Future<void> createTodo(Todo todo) async {
    todos.add(todo);
  }

  @override
  Future<void> deleteTodo(String id) async {
    todos.removeWhere((todo) => todo.id == id);
  }

  @override
  Future<Todo> getTodoById(String id) async {
    return todos.singleWhere((todo) => todo.id == id);
  }

  @override
  Future<List<Todo>> getTodos() async {
    return todos;
  }

  @override
  Future<void> updateTodo(Todo updatedTodo) async {
    final updatedTodoIndex =
        todos.indexWhere((element) => element.id == updatedTodo.id);

    todos[updatedTodoIndex] = updatedTodo;
  }
}
