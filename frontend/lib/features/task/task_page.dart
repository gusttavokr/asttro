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

class TaskPageState extends State<TaskPage>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 600,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Task(
              task: widget.task,
            ),
          ),
        ),
      ),
    );
  }
}