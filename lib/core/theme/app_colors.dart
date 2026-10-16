import 'package:flutter/material.dart';

/// Central colour palette. Change a colour here and it updates everywhere.
abstract final class AppColors {
  static const Color primary = Color(0xFFFFC107); // app bar, dialog, add button
  static const Color background = Color(0xFFFFF59D); // screen background
  static const Color card = Color(0xFFFFE082); // task card
  static const Color danger = Color(0xFFE57373); // delete action
  static const Color action = Color(0xFF4E342E); // dialog buttons
  static const Color onAction = Colors.white;
  static const Color onPrimary = Colors.black87;
}