import 'package:flutter/material.dart';
import '../widgets/todo_item.dart';
import '../widgets/task_input.dart';

class Task {
  final String description;
  final DateTime dueDate;
  bool isCompleted;

  Task({required this.description, required this.dueDate, this.isCompleted = false});
}

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final List<Task> _tasks = [];
  String _filter = 'All';

  void _addTask(String description, DateTime dueDate) {
    setState(() {
      _tasks.add(Task(description: description, dueDate: dueDate));
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  List<Task> get _filteredTasks {
    if (_filter == 'All') {
      return _tasks;
    } else if (_filter == 'Completed') {
      return _tasks.where((task) => task.isCompleted).toList();
    } else {
      return _tasks.where((task) => !task.isCompleted).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                _filter = value;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'All', child: Text('All')),
              PopupMenuItem(value: 'Completed', child: Text('Completed')),
              PopupMenuItem(value: 'Incomplete', child: Text('Incomplete')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TaskInput(onAddTask: _addTask),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredTasks.length,
              itemBuilder: (context, index) {
                final task = _filteredTasks[index];
                return ToDoItem(
                  task: task,
                  onRemove: () => _removeTask(index),
                  onToggle: () => _toggleTaskCompletion(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
