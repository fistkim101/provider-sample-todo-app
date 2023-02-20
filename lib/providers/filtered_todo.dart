import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

import '../enums/enums.dart';
import '../models/model.dart';
import '../providers/providers.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filteredTodos;

  const FilteredTodosState({
    required this.filteredTodos,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [filteredTodos];

  FilteredTodosState copyWith(List<Todo> filteredTodos) {
    return FilteredTodosState(filteredTodos: filteredTodos);
  }
}

class FilteredTodos extends StateNotifier<FilteredTodosState>
    with LocatorMixin {
  FilteredTodos() : super(const FilteredTodosState(filteredTodos: []));

  @override
  void update(Locator watch) {
    final FilterType selectedFilterType = watch<FilterState>().filterType;
    final List<Todo> currentAllTodos = watch<TodosState>().todos;
    final String currentSearchTerm = watch<SearchTermState>().searchTerm ?? '';

    List<Todo> filteredTodos = [];

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

    state = FilteredTodosState(filteredTodos: filteredTodos);
    super.update(watch);
  }
}

// class FilteredTodos {
//   final Todos todos;
//   final Filter filter;
//   final SearchTerm searchTerm;
//
//   FilteredTodos({
//     required this.todos,
//     required this.filter,
//     required this.searchTerm,
//   });
//
//   FilteredTodosState get state {
//     final FilterType selectedFilterType = filter.state.filterType;
//     List<Todo> currentAllTodos = todos.state.todos;
//     List<Todo> filteredTodos = [];
//     String? currentSearchTerm = searchTerm.state.searchTerm;
//
//     if (selectedFilterType == FilterType.all) {
//       filteredTodos = currentAllTodos;
//     }
//
//     if (selectedFilterType == FilterType.completed) {
//       filteredTodos =
//           currentAllTodos.where((todo) => todo.isCompleted).toList();
//     }
//
//     if (selectedFilterType == FilterType.active) {
//       filteredTodos =
//           currentAllTodos.where((todo) => !todo.isCompleted).toList();
//     }
//
//     if (currentSearchTerm != null && currentSearchTerm.isNotEmpty) {
//       filteredTodos = filteredTodos
//           .where((todo) => todo.description.contains(currentSearchTerm))
//           .toList();
//     }
//
//     return FilteredTodosState(filteredTodos: filteredTodos);
//   }
// }
