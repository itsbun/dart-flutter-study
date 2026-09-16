enum TaskPriority { low, medium, high }

class Task {
  final String id;

  final String title;

  final String description;

  final TaskPriority priority;

  final bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    this.isDone = false,
  });
}
