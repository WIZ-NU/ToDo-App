// task.dart

class Task {
  final String id;
  final String title;
  final bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.isDone,
  });

  Task copyWith({
    String? id,
    String? title,
    bool? isDone,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone ? 1 : 0,
    };
  }
}
