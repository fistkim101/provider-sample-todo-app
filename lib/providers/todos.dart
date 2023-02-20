import 'package:equatable/equatable.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import '../models/model.dart';
import '../utils/utils.dart';

class TodosState extends Equatable {
  final List<Todo> todos;

  const TodosState({
    required this.todos,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [todos];

  TodosState copyWith(List<Todo> todos) {
    return TodosState(todos: todos);
  }
}

class Todos extends StateNotifier<TodosState> {
  Todos() : super(const TodosState(todos: []));

  void addTodo(String description) {
    final Todo todo = Todo(
      id: Utils.uuid.v4(),
      description: description,
    );
    final List<Todo> todos = [...state.todos, todo];
    state = state.copyWith(todos);
  }

  // state 가 변경되었다고 인식되지 않음
  // void removeTodo(String removeTargetTodoId) {
  //   print('before : ${state.todos.length}');
  //   state.todos.removeWhere((todo) => todo.id == removeTargetTodoId);
  //   print('after : ${state.todos.length}');
  //
  //   final List<Todo> todos = [...state.todos];
  //   state = state.copyWith(todos);
  // }

  // 잘 작동하는 코드
  void removeTodo(String removeTargetTodoId){
    final List<Todo> todos = [...state.todos.where((todo) => todo.id != removeTargetTodoId).toList()];
    state = state.copyWith(todos);
  }

  void toggleTodo(String completedTodoId) {
    List<Todo> todos = state.todos.map((todo) {
      if (todo.id == completedTodoId) {
        return todo.copyWith(isCompleted: !todo.isCompleted);
      }

      return todo;
    }).toList();

    state = state.copyWith(todos);
  }
}

// class Todos with ChangeNotifier {
//   late TodoState _state;
//   final List<Todo> initialTodos;
//   final Uuid _uuid = Uuid();
//
//   TodoState get state => _state;
//
//   Todos({
//     required this.initialTodos,
//   }) {
//     _state = TodoState(todos: initialTodos);
//   }
//
//   void addTodo(String description) {
//     final Todo todo = Todo(
//       id: _uuid.v4(),
//       description: description,
//     );
//     final List<Todo> todos = [..._state.todos, todo];
//     _state = _state.copyWith(todos);
//     notifyListeners();
//   }
//
//   void removeTodo(String removeTargetTodoId) {
//     _state.todos.removeWhere((todo) => todo.id == removeTargetTodoId);
//     _state = _state.copyWith([..._state.todos]);
//     notifyListeners();
//   }
//
//   void toggleTodo(String completedTodoId) {
//     List<Todo> todos = _state.todos.map((todo) {
//       if (todo.id == completedTodoId) {
//         return todo.copyWith(isCompleted: !todo.isCompleted);
//       }
//
//       return todo;
//     }).toList();
//
//     _state = _state.copyWith(todos);
//     notifyListeners();
//   }
// }
