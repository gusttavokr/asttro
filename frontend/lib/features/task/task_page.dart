import 'package:asttro/core/layout/app_layout.dart';
import 'package:asttro/core/models/task.dart';
import 'package:asttro/features/task/widgets/task.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  final TaskModel task;

  const TaskPage({
    super.key,
    required this.task
  });

  @override
  State<TaskPage> createState() => TaskPageState();
}

class TaskPageState extends State<TaskPage> {

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      breadcrumb: 'Início > Tarefa',
      title: widget.task.title,
      currentIndex: 1,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 32,
          ),
        child: Task(task: widget.task),
      ),
    );
  }
}
