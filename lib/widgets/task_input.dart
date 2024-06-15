import 'package:flutter/material.dart';

class TaskInput extends StatefulWidget {
  final Function(String, DateTime) onAddTask;

  TaskInput({required this.onAddTask});

  @override
  _TaskInputState createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  final TextEditingController _textEditingController = TextEditingController();
  DateTime? _selectedDate;

  void _submitTask() {
    if (_textEditingController.text.isNotEmpty && _selectedDate != null) {
      widget.onAddTask(_textEditingController.text, _selectedDate!);
      _textEditingController.clear();
      setState(() {
        _selectedDate = null;
      });
    }
  }

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(hintText: 'Enter a task'),
          ),
        ),
        IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: _pickDate,
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _submitTask,
        ),
      ],
    );
  }
}
