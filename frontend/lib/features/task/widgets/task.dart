import 'package:asttro/core/models/task.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final TaskModel task;
  const Task({super.key, required this.task});

  @override
  State<Task> createState() => TaskState();
}

class TaskState extends State<Task> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode(); // 1. TRAGA O FOCO PARA CÁ

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.task.content);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose(); // 2. SEMPRE DISPOSE O FOCO
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 3. ENVOLVA O CONTAINER NO GESTURE DETECTOR
    return GestureDetector(
      onTap: () {
        // Isso força a abertura do teclado independente de onde você clique no Container
        FocusScope.of(context).requestFocus(_focusNode);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C28),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // 4. Mude para 'start' para o alinhamento não ficar centralizado enquanto digita!
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   // Opcionlamente, você também pode usar 'Expanded' diretamente no TextField se quiser que
                   // ele empurre pra baixo toda a barra vazia, mas o FocusNode é a melhor alternativa!

                  TextField(
                    cursorColor: Color(0xFFFFFFFF),
                    focusNode: _focusNode, // 5. LIGUE O TEXTFIELD AO FOCO
                    controller: _controller,
                    minLines: 1,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
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
      ),
    );
  }
}