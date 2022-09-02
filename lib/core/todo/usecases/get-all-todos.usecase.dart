import 'package:todo_app/core/todo/todo.model.dart';
import 'package:todo_app/data/todo.repository.dart';

abstract class GetAllTodosUsecase {
  factory GetAllTodosUsecase() => _GetAllTodosUsecaseImpl();

  Future<List<Todo>> execute();
}

class _GetAllTodosUsecaseImpl implements GetAllTodosUsecase {
  final TodoRepository _todoRepo = TodoRepository();

  @override
  Future<List<Todo>> execute() {
    return _todoRepo.getTodos();
  }
}
