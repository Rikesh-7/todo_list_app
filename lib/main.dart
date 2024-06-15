import 'package:flutter/material.dart';
import 'screens/todo_list_screen.dart';
import 'styles/app_styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      theme: AppStyles.themeData,
      home: ToDoListScreen(),
      debugShowCheckedModeBanner: false
    );
  }
}
