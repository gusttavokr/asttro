import 'package:asttro/core/layout/app_layout.dart';
import 'package:asttro/features/home/models/tasks.dart';
import 'package:asttro/features/home/widgets/button_create_task.dart';
import 'package:asttro/features/home/widgets/task_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<TaskModel> filteredTasks = [];

  @override
  void initState() {
    super.initState();

    filteredTasks = List.from(tasks);
  }

  void searchTasks(String value) {
    final results = tasks.where((task) {
      return task.title.toLowerCase().contains(value.toLowerCase());
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
        child: Column(
          children: [
            Expanded(
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

                        return _AnimatedTaskItem(
                          index: index,
                          child: Task(task: task),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ButtonCreateTask(),
            ),
          ],
        ));
  }
}

class _AnimatedTaskItem extends StatefulWidget {
  final Widget child;
  final int index;

  const _AnimatedTaskItem({super.key, required this.child, required this.index});

  @override
  State<_AnimatedTaskItem> createState() => _AnimatedTaskItemState();
}

class _AnimatedTaskItemState extends State<_AnimatedTaskItem>
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
          milliseconds: 600), 
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimation();
    });
  }

  void _startAnimation() async {

    int delayIndex = widget.index > 10 ? 10 : widget.index;
    await Future.delayed(Duration(
        milliseconds: 150 * delayIndex)); 
    if (mounted) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}
