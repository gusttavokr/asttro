import 'dart:math';
import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Container(
            color: const Color(0xFF0D0D1B),
          ),

          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(1.0, -1.0),
                radius: 0.8,
                colors: [
                  Color(0x22FFFFFF),
                  Color(0x11FFFFFF),
                  Colors.transparent,
                ],
                stops: [0.0, 0.45, 1.0],
              ),
            ),
          ),

          const Positioned.fill(
            child: Estrelas(),
          ),
        ],
      ),
    );
  }
}

class Estrelas extends StatefulWidget {
  const Estrelas({super.key});

  @override
  State<Estrelas> createState() => EstrelasState();
}

class EstrelasState extends State<Estrelas> {

  final List<StarData> stars = [];

  @override
  void initState() {
    super.initState();

    final random = Random();

    for (int i = 0; i < 120; i++) {

      stars.add(
        StarData(
          x: random.nextDouble(),
          y: random.nextDouble(),
          radius: 1,
          opacity: 0.2,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StarsPainter(stars),
    );
  }
}

class StarData {
  final double x;
  final double y;
  final double radius;
  final double opacity;

  StarData({
    required this.x,
    required this.y,
    required this.radius,
    required this.opacity,
  });
}

class StarsPainter extends CustomPainter {

  final List<StarData> stars;

  StarsPainter(this.stars);

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    for (final star in stars) {

      paint.color = Colors.white.withOpacity(star.opacity);

      canvas.drawCircle(
        Offset(
          star.x * size.width,
          star.y * size.height,
        ),
        star.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}