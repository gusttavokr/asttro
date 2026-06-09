import 'package:asttro/core/models/task.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final TaskModel task;

  const Task({
    super.key,
    required this.task,
  });

  @override
  State<Task> createState() => TaskState();
}

class TaskState extends State<Task> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.task.content,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_focusNode);
      },
      child: Container(
        height: 120, // altura fixa do card
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C28),
          borderRadius: BorderRadius.circular(24),
        ),
        child: TextField(
          focusNode: _focusNode,
          controller: _controller,
          cursorColor: Colors.white,
          expands: true, // ocupa toda a altura disponível
          minLines: null,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          textAlignVertical: TextAlignVertical.top,
          style: const TextStyle(
            color: Color(0xFFFEFDFB),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }
}