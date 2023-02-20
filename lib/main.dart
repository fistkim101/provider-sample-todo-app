import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'providers/providers.dart';
import 'screens/screens.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<SearchTerm, SearchTermState>(
          create: (_) => SearchTerm(),
        ),
        StateNotifierProvider<Filter, FilterState>(
          create: (_) => Filter(),
        ),
        StateNotifierProvider<Todos, TodosState>(
          create: (_) => Todos(),
        ),
        StateNotifierProvider<ActiveTodoCount, ActiveTodoCountState>(
          create: (_) => ActiveTodoCount(),
        ),
        StateNotifierProvider<FilteredTodos, FilteredTodosState>(
          create: (_) => FilteredTodos(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => SearchTerm(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => Filter(initialFilterType: FilterType.all),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => Todos(initialTodos: []),
        // ),
        // ProxyProvider<Todos, ActiveTodoCount>(
        //   update: (
        //     _,
        //     Todos todos,
        //     __,
        //   ) =>
        //       ActiveTodoCount(todos: todos),
        // ),
        // ProxyProvider3<Todos, Filter, SearchTerm, FilteredTodos>(
        //   update: (
        //     _,
        //     Todos todos,
        //     Filter filter,
        //     SearchTerm searchTerm,
        //     __,
        //   ) =>
        //       FilteredTodos(
        //           todos: todos, filter: filter, searchTerm: searchTerm),
        // )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
