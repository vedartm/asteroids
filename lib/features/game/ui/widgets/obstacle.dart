import 'package:asteroids/features/game/models/particle.dart';
import 'package:flutter/material.dart';

class Obstacle extends StatelessWidget {
  const Obstacle({Key? key, required this.particle}) : super(key: key);

  final Particle particle;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: particle.xPosition,
      top: particle.yPosition,
      child: Container(
        height: (24 * particle.size).toDouble(),
        width: (24 * particle.size).toDouble(),
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
