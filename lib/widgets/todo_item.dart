import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../models/model.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;

  const TodoItem({
    super.key,
    required this.todo,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    final Todos todos = context.read<Todos>();

    return ListTile(
      leading: Checkbox(
        onChanged: (isCompleted) {
          setState(() {
            todos.toggleTodo(widget.todo.id);
          });
        },
        value: widget.todo.isCompleted,
      ),
      title: Text(
        widget.todo.description,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
