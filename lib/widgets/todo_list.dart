import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/model.dart';
import '../providers/providers.dart';
import '../widgets/widget.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final List<Todo> filteredTodos =
        context.watch<FilteredTodosState>().filteredTodos;

    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      separatorBuilder: (_, __) {
        return const Divider(color: Colors.grey);
      },
      itemCount: filteredTodos.length,
      itemBuilder: (_, index) => TodoItem(todo: filteredTodos[index]),
    );
  }
}
