import 'package:asttro/core/layout/app_layout.dart';
import 'package:asttro/features/task/models/task.dart';
import 'package:asttro/features/task/widgets/task.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => TaskPageState();
}

class TaskPageState extends State<TaskPage> {
  // List<TaskModel> filteredTasks = [];

  // @override
  // void initState() {
  //   super.initState();

  //   filteredTasks = List.from(tasks);
  // }

  // void searchTasks(String value) {
  //   final results = tasks.where((task) {
  //     return task.title.toLowerCase().contains(value.toLowerCase());
  //   }).toList();

  //   setState(() {
  //     filteredTasks = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return AppLayout(
      breadcrumb: 'Início > Tarefa',
      title: task.title,
      currentIndex: 1,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 32,
          ),
        child: Task(task: task),
      ),
    );
  }
}
