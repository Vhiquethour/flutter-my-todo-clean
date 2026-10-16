/// A single to-do item. Immutable: use [copyWith] to produce a changed copy.
class Task {
  const Task({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  final String id;
  final String title;
  final bool isDone;

  Task copyWith({String? title, bool? isDone}) {
    return Task(
      id: id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
}