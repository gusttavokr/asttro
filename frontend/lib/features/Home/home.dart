  import 'package:asttro/core/layout/app_layout.dart';
  import 'package:flutter/material.dart';

  class HomePage extends StatelessWidget {
    const HomePage({super.key});

    @override
    Widget build(BuildContext context) {
      return AppLayout(
        breadcrumb: 'Olá, Gustavo 👋',
        title: 'Home',
        currentIndex: 0,

        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text('Conteúdo da home'),
              ),
            ),
          ],
        ),
      );
    }
  }