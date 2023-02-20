import 'package:equatable/equatable.dart';

import '../providers/providers.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;

  const ActiveTodoCountState({
    required this.activeTodoCount,
  });

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

class ActiveTodoCount {
  final Todos todos;

  ActiveTodoCount({
    required this.todos,
  });

  ActiveTodoCountState get state {
    final int newActiveTodoCount =
        todos.state.todos.where((todo) => !todo.isCompleted).toList().length;

    return ActiveTodoCountState(activeTodoCount: newActiveTodoCount);
  }
}
