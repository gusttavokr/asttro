import 'package:asttro/core/models/status.dart';
import 'package:flutter/material.dart';

class TaskModel {
  final String title;
  final IconData icon;
  final String content;
  final DateTime date;
  final Status status;

  TaskModel({
    required this.title,
    required this.icon,
    required this.content,
    required this.date,
    required this.status,
  });
}

final tasks = [
  TaskModel(
    title: "Protótipo Mobile",
    content:
        "Preciso entregar 10 protótipos para o trabalho de Desenvolvimento de dispositivos móveis",
    date: DateTime(2026, 12, 25),
    status: Status.emAndamento,
    icon: Icons.people,
  ),
  
  TaskModel(
    title: "Teste de Software",
    content:
        "Preciso estudar.",
    date: DateTime(2026, 12, 25),
    status: Status.emAndamento,
    icon: Icons.psychology,
  ),

  TaskModel(
    title: "Árvore AVL",
    content:
        "Preciso implementar o balanceamento da árvore AVL",
    date: DateTime(2026, 12, 25),
    status: Status.emAndamento,
    icon: Icons.people,
  ),

  TaskModel(
    title: "Doar sangue",
    content:
        "Preciso doar sangue na terça feira.",
    date: DateTime(2026, 12, 25),
    status: Status.emAndamento,
    icon: Icons.psychology,
  ),
] ;