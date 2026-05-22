import 'package:asttro/core/layout/app_layout.dart';
import 'package:asttro/features/home/models/tasks.dart';
import 'package:asttro/features/home/widgets/task_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      breadcrumb: 'Olá, Gustavo 👋',
      title: 'Suas tarefas pendentes:',
      currentIndex: 0,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final task = tasks[index];

          return Task(
            title: task['title'] as String,
            icon: task['icon'] as IconData,
          );
        },
      ),
    );
  }
}
