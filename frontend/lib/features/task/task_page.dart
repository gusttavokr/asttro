import 'package:asttro/core/layout/app_layout.dart';
import 'package:asttro/core/models/task.dart';
import 'package:asttro/features/task/widgets/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskPage extends StatefulWidget {
  final TaskModel task;

  const TaskPage({super.key, required this.task});

  @override
  State<TaskPage> createState() => TaskPageState();
}

class TaskPageState extends State<TaskPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // 1. Declaração dos controladores para os TextFields
  late TextEditingController _titleController;
  late TextEditingController _dateController;
  late TextEditingController _statusController;

  @override
  void initState() {
    super.initState();

    // 2. Inicialização dos controladores com os dados da Task
    _titleController = TextEditingController(text: widget.task.title);
    _dateController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(widget.task.dateCreate),
    );
    _statusController =
        TextEditingController(text: widget.task.status.toString());

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
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
    // 3. Limpeza dos controladores para evitar vazamento de memória
    _titleController.dispose();
    _dateController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      breadcrumb: 'Início > Tarefa',
      title: '',
      titleWidget: TextField(
        controller: _titleController,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        decoration: const InputDecoration(
          hintText: 'Título da Tarefa',
          hintStyle: TextStyle(color: Colors.white60),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
      ),
      currentIndex: 1,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: _dateController,
                      style: const TextStyle(color: Colors.white),
                      readOnly: true,

                      // atualizando data selecionada 
                      onTap: () async{

                        final DateTime? dataSelecionada = await showDatePicker(
                          context: context,
                          initialDate: widget.task.dateCreate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                          locale: const Locale('pt', 'BR'), // 💡 Deixa o calendário em português
                        );

                        if (dataSelecionada != null){
                          setState(() {
                            _dateController.text = DateFormat('dd/MM/yyyy').format(dataSelecionada);
                          });
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Data de Criação',
                        labelStyle: TextStyle(color: Colors.white60),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white30)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    )),
                    const SizedBox(width: 16),

                    // status selectbox
                    Expanded(
                      child: DropdownButtonFormField<String>(

                        initialValue: widget.task.status.toString().split('.').last,

                        dropdownColor: Colors.white,

                        borderRadius: BorderRadius.circular(12),

                        items: const [
                          DropdownMenuItem(value: 'pendente', child: Text('Pendente', style: TextStyle(color: Colors.black))),
                          DropdownMenuItem(value: 'emAndamento', child: Text('Em Andamento', style: TextStyle(color: Colors.black))),
                          DropdownMenuItem(value: 'concluido', child: Text('Concluído', style: TextStyle(color: Colors.black)))
                        ],

                        selectedItemBuilder: (BuildContext context) {
                          return [
                            'Pendente',
                            'Em Andamento',
                            'Concluído',
                          ].map<Widget>((String item) {
                            return Text(
                              item,
                              style: const TextStyle(color: Colors.white), // Altere aqui para a cor que você quiser na tela (ex: Colors.amber, Colors.grey, etc.)
                            );
                          }).toList();
                        },


                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              _statusController.text = newValue; 
                            });
                          }
                        },
                      
                        decoration: InputDecoration(
                          labelText: 'Status',
                          labelStyle: TextStyle(color: Colors.white60),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white30)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        ),
                      )
                    ),
                  ],
                ),
              ),

              // Bloco da Task ocupando o restante do espaço
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 32,
                  ),
                  child: Task(
                    task: widget.task,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
