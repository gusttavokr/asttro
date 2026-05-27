import 'package:asttro/features/task/models/task.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final TaskModel task;
  const Task({super.key, required this.task});

  @override
  State<Task> createState() => TaskState();
}

class TaskState extends State<Task> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.task.content);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF1C1C28),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _controller,

                  minLines: 1,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,

                  // Mantendo o mesmo estilo visual de antes:
                  style: const TextStyle(
                    color: Color(0xFFFEFDFB),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),

                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
