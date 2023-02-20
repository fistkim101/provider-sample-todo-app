import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class AddTodoTextField extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  AddTodoTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      decoration: const InputDecoration(
        label: Text(
          'What to do?',
        ),
      ),
      onSubmitted: (description) => context.read<Todos>().addTodo(description),
    );
  }
}
