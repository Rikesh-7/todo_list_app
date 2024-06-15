import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../screens/todo_list_screen.dart';

class ToDoItem extends StatelessWidget {
  final Task task;
  final VoidCallback onRemove;
  final VoidCallback onToggle;

  ToDoItem({required this.task, required this.onRemove, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.description,
        style: TextStyle(
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text('Due: ${DateFormat.yMMMd().format(task.dueDate)}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              task.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
            ),
            onPressed: onToggle,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
