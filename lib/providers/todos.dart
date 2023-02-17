import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

import '../models/model.dart';

class TodoState extends Equatable {
  final List<Todo> todos;

  const TodoState({
    required this.todos,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [todos];

  TodoState copyWith(List<Todo> todos) {
    return TodoState(todos: todos);
  }
}

class Todos with ChangeNotifier {
  late TodoState _state;
  final List<Todo> initialTodos;
  final Uuid _uuid = Uuid();

  TodoState get state => _state;

  Todos({
    required this.initialTodos,
  }) {
    _state = TodoState(todos: initialTodos);
  }

  void addTodo(String description) {
    final Todo todo = Todo(
      id: _uuid.v4(),
      description: description,
    );
    final List<Todo> todos = [..._state.todos, todo];
    _state = _state.copyWith(todos);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _state.todos.removeWhere((todo) => todo.id == todo.id);
    _state = _state.copyWith([..._state.todos]);
    notifyListeners();
  }

  void toggleTodo(String completedTodoId) {
    List<Todo> todos = _state.todos.map((todo) {
      if (todo.id == completedTodoId) {
        return todo.copyWith(isCompleted: !todo.isCompleted);
      }

      return todo;
    }).toList();

    _state = _state.copyWith(todos);
    notifyListeners();
  }
}
