import 'package:todo_app/data/todo.repository.dart';

abstract class DeleteTodoUsecase {
  factory DeleteTodoUsecase() => _DeleteTodoUsecaseImpl();

  Future<void> execute(String deletedTodoId);
}

class _DeleteTodoUsecaseImpl implements DeleteTodoUsecase {
  final TodoRepository _todoRepo = TodoRepository();

  @override
  Future<void> execute(String deletedTodoId) {
    return _todoRepo.deleteTodo(deletedTodoId);
  }
}
