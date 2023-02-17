class Todo {
  final String id;
  String description;
  bool isCompleted;

  Todo({
    required this.id,
    required this.description,
    this.isCompleted = false,
  });
}
