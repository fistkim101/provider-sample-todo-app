import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../enums/enums.dart';
import '../models/model.dart';
import '../providers/providers.dart';

class FilteredTodoState extends Equatable {
  final List<Todo> filteredTodos;

  const FilteredTodoState({
    required this.filteredTodos,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [filteredTodos];

  FilteredTodoState copyWith(List<Todo> filteredTodos) {
    return FilteredTodoState(filteredTodos: filteredTodos);
  }
}

class FilteredTodos with ChangeNotifier {
  late FilteredTodoState _state;
  final List<Todo> filteredTodos;

  FilteredTodoState get state => _state;

  FilteredTodos({
    required this.filteredTodos,
  }) {
    _state = FilteredTodoState(filteredTodos: filteredTodos);
  }

  void update(Todos todos, Filter filter, SearchTerm searchTerm) {
    final FilterType selectedFilterType = filter.state.filterType;
    List<Todo> currentAllTodos = todos.state.todos;
    List<Todo> filteredTodos = [];
    String? currentSearchTerm = searchTerm.state.searchTerm;

    if (selectedFilterType == FilterType.all) {
      filteredTodos = currentAllTodos;
    }

    if (selectedFilterType == FilterType.completed) {
      filteredTodos =
          currentAllTodos.where((todo) => todo.isCompleted).toList();
    }

    if (selectedFilterType == FilterType.active) {
      filteredTodos =
          currentAllTodos.where((todo) => !todo.isCompleted).toList();
    }

    if (currentSearchTerm != null && currentSearchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((todo) => todo.description.contains(currentSearchTerm))
          .toList();
    }

    _state = _state.copyWith(filteredTodos);
    notifyListeners();
  }
}
