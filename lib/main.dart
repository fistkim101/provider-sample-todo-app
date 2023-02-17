import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'enums/enums.dart';
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
        ChangeNotifierProvider(
          create: (_) => SearchTerm(),
        ),
        ChangeNotifierProvider(
          create: (_) => Filter(initialFilterType: FilterType.all),
        ),
        ChangeNotifierProvider(
          create: (_) => Todos(initialTodos: []),
        ),
        ChangeNotifierProxyProvider<Todos, ActiveTodoCount>(
          create: (_) => ActiveTodoCount(
            initialActiveTodoCount: 0,
          ),
          update: (
            _,
            Todos todos,
            ActiveTodoCount? activeTodoCount,
          ) =>
              activeTodoCount!..update(todos),
        ),
        ChangeNotifierProxyProvider3<Todos, Filter, SearchTerm, FilteredTodos>(
          create: (_) => FilteredTodos(
            filteredTodos: [],
          ),
          update: (
            _,
            Todos todos,
            Filter filter,
            SearchTerm searchTerm,
            FilteredTodos? filteredTodos,
          ) =>
              filteredTodos!..update(todos, filter, searchTerm),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
