import 'package:todo_app/core/todo/todo.model.dart';
import 'package:todo_app/data/todo.repository.dart';

abstract class CreateTodoUsecase {
  factory CreateTodoUsecase() => _CreateTodoUsecaseImpl();

  Future<void> execute(Todo todo);
}

class _CreateTodoUsecaseImpl implements CreateTodoUsecase {
  final TodoRepository _todoRepo = TodoRepository();

  @override
  Future<void> execute(Todo todo) {
    return _todoRepo.createTodo(todo);
  }
}
