import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../models/task.dart';

/// One task card: a checkbox, the title, and swipe-left to delete.
class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
  });

  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  static const double _height = 82;
  static const double _radius = 20;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_radius),
      child: Dismissible(
        key: ValueKey(task.id),
        direction: DismissDirection.endToStart,
        onDismissed: (_) => onDelete(),
        background: const _DeleteBackground(),
        child: Container(
          height: _height,
          color: AppColors.card,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            children: [
              Checkbox(value: task.isDone, onChanged: (_) => onToggle()),
              const SizedBox(width: 8),
              Expanded(child: _TaskTitle(task: task)),
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskTitle extends StatelessWidget {
  const _TaskTitle({required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Text(
      task.title,
      style: TextStyle(
        fontSize: 16,
        decoration:
            task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

class _DeleteBackground extends StatelessWidget {
  const _DeleteBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.danger,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 56),
      child: const Icon(Icons.delete, color: Colors.white),
    );
  }
}