import 'package:asttro/core/widgets/background.dart';
import 'package:asttro/core/widgets/bottom_bar.dart';
import 'package:asttro/core/widgets/button_create.dart';
import 'package:asttro/core/widgets/search_bar.dart';
import 'package:asttro/features/home/home_page.dart';
import 'package:asttro/features/task/task_page.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final String breadcrumb;
  final String title;
  final Widget child;
  final int currentIndex;
  final Function(String)? onSearch;

  const AppLayout({
    super.key,
    required this.breadcrumb,
    required this.title,
    required this.child,
    this.currentIndex = 0,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Stack(
        children: [
          const AppBackground(),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double maxWidth =
                    constraints.maxWidth > 500 ? 500 : constraints.maxWidth;

                return Center(
                  child: SizedBox(
                    width: maxWidth,
                    child: Column(
                      children: [
                        // SEARCH BAR
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: SearchTask(onSearch: onSearch),
                        ),

                        const SizedBox(height: 20),
                        // BREADCRUMB
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              breadcrumb,
                              style: const TextStyle(
                                color: Color(0xFFFEFDFB),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        // TÍTULO
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFEFDFB),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // CONTEÚDO
                        Expanded(
                          child: child,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (currentIndex == index) {
            return;
          }


          switch (index){
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage())
              ); 
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TaskPage())
              ); // Temporario
          }
        },
      ),
    );
  }
}
