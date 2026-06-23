import 'package:flutter/material.dart';

class EmergencyItem {
  final String name;
  final String description;
  final String category;
  final IconData icon;
  bool isChecked;

  EmergencyItem({
    required this.name,
    required this.description,
    required this.category,
    required this.icon,
    this.isChecked = false,
  });
}
