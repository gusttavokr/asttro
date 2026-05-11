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
    return ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(24),
        child: NavigationBar(
            selectedIndex: currentIndex,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: const [
              NavigationDestination(icon: Icon(LucideIcons.house), label: ''),
              NavigationDestination(icon: Icon(LucideIcons.house), label: ''),
              NavigationDestination(icon: Icon(LucideIcons.house), label: ''),
              NavigationDestination(icon: Icon(LucideIcons.house), label: ''),
            ])
        // child: BottomNavigationBar(

        //   unselectedItemColor: Color(0xFF1A1C1E),
        //   currentIndex: currentIndex,
        //   type: BottomNavigationBarType.fixed,

        //   selectedFontSize: 0,
        //   unselectedFontSize: 0,

        //   items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(LucideIcons.house),
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(LucideIcons.clipboardPen),
        //       // label: 'Tarefas',
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(LucideIcons.botMessageSquare),
        //       // label: 'Perfil',
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(LucideIcons.cog),
        //       label: '',
        //       // label: 'Perfil',
        //     ),
        //   ],
        // ),
        );
  }
}
