import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../enums/enums.dart';
import '../models/model.dart';
import '../providers/providers.dart';

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
    return Dismissible(
      key: ValueKey(widget.todo.id),
      onDismissed: (_) {
        context.read<Todos>().removeTodo(widget.todo.id);
      },
      background: _buildDismissibleBackground(DirectionType.left),
      secondaryBackground: _buildDismissibleBackground(DirectionType.right),
      confirmDismiss: (_) {
        return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do you really want to delete?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('NO'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('YES'),
                ),
              ],
            );
          },
        );
      },
      child: ListTile(
        leading: Checkbox(
          onChanged: (isCompleted) {
            setState(() {
              context.read<Todos>().toggleTodo(widget.todo.id);
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
      ),
    );
  }

  Widget _buildDismissibleBackground(DirectionType directionType) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.red,
      alignment: directionType == DirectionType.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        size: 30.0,
        color: Colors.white,
      ),
    );
  }
}
