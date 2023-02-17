import 'package:flutter/material.dart';

import '../widgets/widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                AppTitle(),
                AddTodoTextField(),
                SizedBox(
                  height: 15,
                ),
                SearchBox(),
                SizedBox(
                  height: 15,
                ),
                Filters(),
                SizedBox(
                  height: 15,
                ),
                TodoList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
