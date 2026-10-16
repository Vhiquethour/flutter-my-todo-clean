//
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_todo_clean/app.dart';

void main() {
  testWidgets('shows the ToDo screen and seeded tasks', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ToDoApp());

    expect(find.text('My ToDo'), findsOneWidget);
    expect(find.text('play a game'), findsOneWidget);
    expect(find.text('clean the honda'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
