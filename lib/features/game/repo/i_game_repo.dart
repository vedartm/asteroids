import 'package:asteroids/features/game/models/particle.dart';

abstract class IGameRepo {
  Future<void> saveScore(Duration duration);

  Future<Duration> fetchHighScore();

  List<Particle> generateRandomParticles();
}
