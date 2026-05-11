import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String title;
  final IconData icon;

  const Task({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Color(0xFFECF0F3),
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,

            decoration: BoxDecoration(
              color: Color(0xFF1A1C1E),
              borderRadius: BorderRadius.circular(14)
            ),

            child: Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
          ),

          const SizedBox(width: 20),

          Column(
            children: [ 
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF1A1C1E),
                  fontSize: 18,
                  fontWeight: FontWeight(600),
                ),
              ),
            ],
          ),
      
          const SizedBox(height: 8),
        ],  
      ),
    );
  }
}