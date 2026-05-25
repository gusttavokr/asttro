import 'package:flutter/material.dart';

class SearchTask extends StatelessWidget {

  final Function(String)? onSearch;

  const SearchTask({
    super.key,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),

      child: TextField(
        onChanged: onSearch,

        decoration: InputDecoration(
          hintText: 'Buscar tarefa...',
          prefixIcon: const Icon(Icons.search),

          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}