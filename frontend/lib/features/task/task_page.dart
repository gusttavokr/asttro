import 'package:asttro/core/layout/app_layout.dart';
import 'package:asttro/features/home/models/tasks.dart';
import 'package:asttro/features/home/widgets/task_home.dart';
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
    TaskModel task = TaskModel(title: "Teste", icon: Icons.drafts);

    return AppLayout(
      breadcrumb: 'Olá, Gustavo 👋',
      title: task.title,
      currentIndex: 1,
      child: 
        Task(task: task)
    );
  }
}
