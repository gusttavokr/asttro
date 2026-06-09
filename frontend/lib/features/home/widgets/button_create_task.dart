import 'package:asttro/core/models/status.dart';
import 'package:asttro/core/models/task.dart';
import 'package:asttro/core/widgets/button_create.dart';
import 'package:asttro/features/task/task_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCreateTask extends StatelessWidget {
  const ButtonCreateTask({super.key});

  void criarTarefa(BuildContext context) {
    final taskEmBranco = TaskModel(
      title: "",
      content:
          "",
      dateCreate: DateTime.now(),
      status: Status.emAndamento,
      icon: Icons.people,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskPage(task: taskEmBranco),
      ),
    );

    print('Criado');
  }

  @override
  Widget build(BuildContext context) {
    return ButtonCreate(
      label: 'Criar nova Tarefa',
      onPressed: () => criarTarefa(context),
    );
  }
}
