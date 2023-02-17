import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

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

  TodoState get state => _state;

  Todos({
    required this.initialTodos,
  }) {
    _state = TodoState(todos: initialTodos);
  }

  void addTodo(Todo todo) {
    final List<Todo> todos = [..._state.todos, todo];
    _state = _state.copyWith(todos);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _state.todos.removeWhere((todo) => todo.id == todo.id);
    _state = _state.copyWith([..._state.todos]);
    notifyListeners();
  }
}
