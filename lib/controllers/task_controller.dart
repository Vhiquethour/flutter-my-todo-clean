import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../models/task.dart';

/// Holds the task list and the rules for changing it.
///
/// The UI listens to this object and rebuilds when it changes, so no screen
/// needs to manipulate the list directly.
class TaskController extends ChangeNotifier {
  TaskController({List<Task> initialTasks = const []})
      : _tasks = List.of(initialTasks);

  final List<Task> _tasks;

  /// Read-only view of the current tasks.
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void add(String title) {
    final trimmed = title.trim();
    if (trimmed.isEmpty) return;

    _tasks.add(Task(id: _newId(), title: trimmed));
    notifyListeners();
  }

  void toggle(String id) {
    final index = _indexOf(id);
    if (index == -1) return;

    _tasks[index] = _tasks[index].copyWith(isDone: !_tasks[index].isDone);
    notifyListeners();
  }

  void remove(String id) {
    final index = _indexOf(id);
    if (index == -1) return;

    _tasks.removeAt(index);
    notifyListeners();
  }

  int _indexOf(String id) => _tasks.indexWhere((task) => task.id == id);

  String _newId() => DateTime.now().microsecondsSinceEpoch.toString();
}