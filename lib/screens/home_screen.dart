import 'package:flutter/material.dart';

import '../controllers/task_controller.dart';
import '../models/task.dart';
import '../widgets/add_task_dialog.dart';
import '../widgets/task_tile.dart';

/// Main screen: the task list and the button that adds a task.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskController _controller = TaskController(
    initialTasks: const [
      Task(id: '1', title: 'play a game'),
      Task(id: '2', title: 'clean the honda', isDone: true),
    ],
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onAddPressed() async {
    final title = await showAddTaskDialog(context);
    if (title != null) _controller.add(title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My ToDo')),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          final tasks = _controller.tasks;

          if (tasks.isEmpty) {
            return const Center(child: Text('No tasks yet.'));
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
            itemCount: tasks.length,
            separatorBuilder: (_, __) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskTile(
                task: task,
                onToggle: () => _controller.toggle(task.id),
                onDelete: () => _controller.remove(task.id),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAddPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}