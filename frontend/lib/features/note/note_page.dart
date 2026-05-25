import 'package:asttro/core/layout/app_layout.dart';
import 'package:asttro/features/note/models/note.dart';
import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => NotePageState();
}

class NotePageState extends State<NotePage>{

  List<NoteModel> filteredNotes = [];

  @override
  void initState(){
    super.initState();

    filteredNotes = List.from(notes);
  }

  void searchNotes(String value){
    final results = notes.where((task){

      return task.content
        .toLowerCase()
        .contains(value.toLowerCase());
    }).toList();
  
    setState(() {
      filteredNotes = results;
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      breadcrumb: 'No que está pensando? 🤔',
      title: 'Suas anotações:',
      currentIndex: 0,
      onSearch: searchNotes,
      child: filteredNotes.isEmpty
        ? const Center(
          child: Text(
            'Nenhuma tarefa encontrada',
          ),
        )
      : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: filteredNotes.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final note = filteredNotes[index];

          return Note(note: note);
        },
      ),
    );
  }
}