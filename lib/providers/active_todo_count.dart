import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

import '../models/model.dart';
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

class ActiveTodoCount extends StateNotifier<ActiveTodoCountState>
    with LocatorMixin {
  ActiveTodoCount() : super(const ActiveTodoCountState(activeTodoCount: 0));

  @override
  void update(Locator watch) {
    final List<Todo> todos = watch<TodosState>().todos;
    final int newActiveTodoCount =
        todos.where((todo) => !todo.isCompleted).toList().length;
    state = ActiveTodoCountState(activeTodoCount: newActiveTodoCount);

    super.update(watch);
  }
}

// class ActiveTodoCount {
//   final Todos todos;
//
//   ActiveTodoCount({
//     required this.todos,
//   });
//
//   ActiveTodoCountState get state {
//     final int newActiveTodoCount =
//         todos.state.todos.where((todo) => !todo.isCompleted).toList().length;
//
//     return ActiveTodoCountState(activeTodoCount: newActiveTodoCount);
//   }
// }
