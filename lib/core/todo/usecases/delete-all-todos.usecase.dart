import 'package:todo_app/data/todo.repository.dart';

abstract class DeleteAllTodosUsecase {
  factory DeleteAllTodosUsecase() => _DeleteAllTodosUsecaseImpl();

  Future<void> execute();
}

class _DeleteAllTodosUsecaseImpl implements DeleteAllTodosUsecase {
  final TodoRepository _todoRepo = TodoRepository();

  @override
  Future<void> execute() async {
    List<String> allIds = await _todoRepo
        .getTodos()
        .then((todos) => todos.map((e) => e.id).toList());

    for (var id in allIds) {
      await _todoRepo.deleteTodo(id);
    }

    return;
  }
}
