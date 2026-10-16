import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/home_screen.dart';

/// Root widget: configures the theme and the first screen.
class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My ToDo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}