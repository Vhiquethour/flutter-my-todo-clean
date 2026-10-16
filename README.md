# my_todo_clean

A simple Flutter to-do app with swipe-to-delete, an add-task dialog and a clean, layered structure (models, controllers, screens, widgets). Built with Material 3 and no third-party packages. 

<img width="250" alt="My Todo-1" src="https://github.com/user-attachments/assets/ad3833b3-8c0c-437e-8632-04d027130a55" />
<img width="250" alt="My Todo-2" src="https://github.com/user-attachments/assets/6d94baac-5af1-4d32-9987-be03e089e230" />
<img width="250" alt="My Todo-3" src="https://github.com/user-attachments/assets/4d366a37-912b-4ef8-85c4-aeed64eb71c1" />

## Download
Get the latest APk now. [DOWNLOAD!](https://github.com/Vhiquethour/flutter-my-todo-clean/releases/download/v1.0.0/app-release.apk).

## Features
- Add tasks with a dialog
- Tick tasks off, shown with a strikethrough
- Swipe left to delete
- Centralised colours and theme

## Tech stack
Flutter, Dart, Material 3, Git and GitHub, GitHub Codespaces

## Structure
lib/

--main.dart                  entry point

--app.dart                   MaterialApp and theme wiring

--core/theme/                colours and theme

--models/task.dart           immutable Task model

--controllers/               TaskController (state and rules)

--screens/home_screen.dart   main screen

--widgets/                   TaskTile, add-task dialog

## What I learned
Separating models, controllers and screens made the code easier to change. I also solved a build failure caused by memory limits in a cloud environment.
