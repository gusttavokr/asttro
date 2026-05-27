import 'package:asttro/features/task/models/status.dart';

class TaskModel {
  final String content;
  final DateTime date;
  final Status status;
  final String title;

  TaskModel({
    required this.content,
    required this.date,
    required this.status,
    required this.title,
  });
}

final task = TaskModel(
  title: "Protótipo Mobile",
  content:
      "Preciso entregar 10 protótipos para o trabalho de Desenvolvimento de dispositivos móveis",
  date: DateTime(2026, 12, 25),
  status: Status.emAndamento
);
