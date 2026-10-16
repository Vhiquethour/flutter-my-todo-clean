import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

/// Shows the "new task" dialog and returns the entered text,
/// or `null` if the user cancels.
Future<String?> showAddTaskDialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (_) => const _AddTaskDialog(),
  );
}

class _AddTaskDialog extends StatefulWidget {
  const _AddTaskDialog();

  @override
  State<_AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<_AddTaskDialog> {
  // Owned by the dialog's State so it is disposed at the right moment.
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _save() => Navigator.of(context).pop(_controller.text);

  void _cancel() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 48, 40, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              autofocus: true,
              cursorColor: AppColors.action,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _save(),
              decoration: const InputDecoration(
                hintText: 'Enter new task.',
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _DialogButton(label: 'Save', onPressed: _save),
                const SizedBox(width: 16),
                _DialogButton(label: 'Cancel', onPressed: _cancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogButton extends StatelessWidget {
  const _DialogButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.action,
        foregroundColor: AppColors.onAction,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Text(label),
    );
  }
}