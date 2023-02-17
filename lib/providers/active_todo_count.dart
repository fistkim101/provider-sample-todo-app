import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../providers/providers.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;

  const ActiveTodoCountState({
    required this.activeTodoCount,
  });

  // factory ActiveTodoCountState.initial() {
  //   return const ActiveTodoCountState(activeTodoCount: 0);
  // }

  @override
  List<Object> get props {
    return [activeTodoCount];
  }

  @override
  bool get stringify => true;

  ActiveTodoCountState copyWith(int activeTodoCount) {
    return ActiveTodoCountState(activeTodoCount: activeTodoCount);
  }
}

class ActiveTodoCount with ChangeNotifier {
  late ActiveTodoCountState _state;
  final int initialActiveTodoCount;

  ActiveTodoCountState get state => _state;

  ActiveTodoCount({
    required this.initialActiveTodoCount,
  }) {
    _state = ActiveTodoCountState(activeTodoCount: initialActiveTodoCount);
  }

  void update(Todos todos) {
    final int newActiveTodoCount =
        todos.state.todos.where((todo) => !todo.isCompleted).toList().length;
    _state = _state.copyWith(newActiveTodoCount);
    notifyListeners();
  }
}
