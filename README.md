# my_todo_clean

A simple Flutter to-do app with swipe-to-delete, an add-task dialog and a clean, layered structure (models, controllers, screens, widgets). Built with Material 3 and no third-party packages.

## Getting Started

This project is a starting point for a Flutter application with exemplary structure and clean architecture.

## Structure

lib/

--main.dart                  entry point

--app.dart                   MaterialApp and theme wiring

--core/theme/                colours and theme

--models/task.dart           immutable Task model

--controllers/               TaskController (state and rules)

--screens/home_screen.dart   main screen

--widgets/                   TaskTile, add-task dialog
