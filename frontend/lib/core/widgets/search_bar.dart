import 'package:flutter/material.dart';

class SearchTask extends StatelessWidget {
  final Function(String)? onSearch;

  const SearchTask({
    super.key,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSearch,
      style: const TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white.withValues(alpha: 0.5),
      decoration: InputDecoration(
        hintText: 'Pesquisar tarefa...',

        hintStyle: TextStyle(
          color: Colors.white.withValues(alpha: 0.5),
        ),

        prefixIcon: const Icon(
          Icons.search,
          color: Colors.white,
        ),

        filled: true,

        fillColor: Color(0xFF1C1C28),

        // contentPadding: const EdgeInsets.symmetric(
        //   horizontal: 16,
        // ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
