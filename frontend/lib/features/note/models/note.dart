class NoteModel {
  final String content;

  NoteModel({
    required this.content,
  });
}

final notes = [
  NoteModel(
    content: 'Preciso estudar para a matéria de Mobile, provavelmente vai cair gerenciamento de estados e navegação',
  ),

  NoteModel(
    content: 'Preciso estudar para a matéria de Testes',
  ),

  NoteModel(
    content: 'Preciso treinar.',
  ),

  NoteModel(
    content: 'No dia 15/05 doei sangue, foi a melhor experiência que tive pois fiquei feliz.',
  ),
];