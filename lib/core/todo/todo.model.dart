enum TodoStatus { isNotDone, isDone }

class Todo {
  Todo({required this.id, required this.body, required this.status});

  String id;
  String body;
  TodoStatus status;
}
