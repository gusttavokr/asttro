import 'package:asttro/core/layout/app_layout.dart';
import 'package:asttro/features/home/models/tasks.dart';
import 'package:asttro/features/home/widgets/task_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  List<TaskModel> filteredTasks = [];

  @override
  void initState(){
    super.initState();

    filteredTasks = List.from(tasks);
  }

  void searchTasks(String value){
    final results = tasks.where((task){

      return task.title
        .toLowerCase()
        .contains(value.toLowerCase());
    }).toList();
  
    setState(() {
      filteredTasks = results;
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      breadcrumb: 'Olá, Gustavo 👋',
      title: 'Suas tarefas pendentes:',
      currentIndex: 0,
      onSearch: searchTasks,
      child: filteredTasks.isEmpty
        ? const Center(
          child: Text(
            'Nenhuma tarefa encontrada',
          ),
        )
      : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: filteredTasks.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final task = filteredTasks[index];

          return Task(task: task);
        },
      ),
    );
  }
}