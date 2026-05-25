import 'package:flutter/material.dart';

class TaskModel {
  final String title;
  final IconData icon;

  TaskModel({
    required this.title,
    required this.icon,
  });
}

final tasks = [
  TaskModel(
    title: 'Protótipo Mobile',
    icon: Icons.people,
  ),

  TaskModel(
    title: 'Testes de Software',
    icon: Icons.psychology,
  ),

  TaskModel(
    title: 'Árvore AVL',
    icon: Icons.account_tree,
  ),

  TaskModel(
    title: 'Doar Sangue',
    icon: Icons.water_drop,
  ),
];