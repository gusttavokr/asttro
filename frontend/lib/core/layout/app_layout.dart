import 'package:asttro/core/widgets/background.dart';
import 'package:asttro/core/widgets/bottom_bar.dart';
import 'package:asttro/core/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final String breadcrumb;
  final String title;
  final Widget child;
  final int currentIndex;

  const AppLayout({
    super.key,
    required this.breadcrumb,
    required this.title,
    required this.child,
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const AppBackground(),
          
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {

                double maxWidth = constraints.maxWidth > 500 ? 500 : constraints.maxWidth;

                return Center( 
                  child: SizedBox(
                    width: maxWidth, 
                    child: Column(
                      children: [
                        // SEARCH BAR
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: SearchBarApp(),
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
                                color: Colors.white,
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
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
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

      bottomNavigationBar: AppBottomBar(currentIndex: currentIndex),
    );
  }
  
}
