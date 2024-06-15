class Task {
  final String description;
  final DateTime dueDate;
  bool isCompleted;

  Task({required this.description, required this.dueDate, this.isCompleted = false});
}
