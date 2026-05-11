import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AppBottomBar extends StatelessWidget {
  final int currentIndex;

  const AppBottomBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final icons = [
      LucideIcons.house,
      LucideIcons.clipboardPen,
      LucideIcons.botMessageSquare,
      LucideIcons.cog,
    ];

    return Container(
      margin: const EdgeInsets.fromLTRB(
        16,
        32,
        16,
        32,
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),

      decoration: BoxDecoration(
        color: Color(0xFFECF0F3),
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround,

        children: List.generate(
          icons.length,
          (index) {
            final isSelected =
                currentIndex == index;

            return Container(
              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF1A1C1E)
                    : Colors.transparent,

                borderRadius:
                    BorderRadius.circular(14),
              ),

              child: Icon(
                icons[index],

                color: isSelected
                    ? Colors.white
                    : Colors.black54,
              ),
            );
          },
        ),
      ),
    );
  }
}