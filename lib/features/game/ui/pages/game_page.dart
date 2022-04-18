import 'dart:async';
import 'dart:math';

import 'package:asteroids/core/utils/extensions.dart';
import 'package:asteroids/features/game/models/particle.dart';
import 'package:asteroids/features/game/models/player.dart';
import 'package:asteroids/features/game/ui/pages/score_page.dart';
import 'package:asteroids/features/game/ui/widgets/obstacle.dart';
import 'package:asteroids/features/game/ui/widgets/spaceship.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Player _player;
  late List<Particle> _particles;

  @override
  void initState() {
    super.initState();
    _player = Player(const Duration(seconds: 0), 1, 0, 0);
    _particles = [];
  }

  @override
  void didChangeDependencies() {
    final _size = MediaQuery.of(context).size;
    _player = _player.copyWith(
      xPosition: _size.width / 2,
      yPosition: _size.height / 2,
    );

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (timer.tick % 10 == 0) {
        setState(() {
          _player = _player.copyWith(
            duration: Duration(seconds: timer.tick ~/ 10),
            level: timer.tick % 150 == 0 ? _player.level + 1 : _player.level,
          );
        });
      }
      if (timer.tick % 150 == 0) {
        _particles.add(Particle(
          Random().nextInt(4),
          Random().nextBool() ? 2 : -2,
          Random().nextBool() ? 2 : -2,
          Random().nextInt(_size.width.toInt()).toDouble(),
          Random().nextInt(_size.height.toInt()).toDouble(),
          // Random().nextBool() ? 0 : _size.width,
          // Random().nextBool() ? 0 : _size.height,
        ));
      }
      final list = List<Particle>.from(_particles);
//       final playerPositions = [
// _player.xPosition,
// _player.xPosition + 24,
// _player.yPosition,
// _player.yPosition + 24,
//       ];
      final px = _player.xPosition;
      final px1 = _player.xPosition + 24;
      final py = _player.yPosition;
      final py1 = _player.yPosition + 24;
      for (var i = 0; i < list.length; i++) {
        var particle = list[i];
        final ox = particle.xPosition;
        final ox1 = particle.xPosition + particle.size * 24;
        final oy = particle.yPosition;
        final oy1 = particle.yPosition + particle.size * 24;
        if (((px >= ox && px <= ox1) && (py >= oy && py <= oy1)) ||
            ((px1 >= ox && px1 <= ox1) && (py1 >= oy && py1 <= oy1))) {
          timer.cancel();
          gameOver();
        }
        list[i] = particle.copyWith(
          xPosition: particle.xPosition + particle.xVelocity,
          yPosition: particle.yPosition + particle.yVelocity,
          xVelocity: particle.xPosition <= 0
              ? 1
              : particle.xPosition >= _size.width - particle.size * 24
                  ? -1
                  : particle.xVelocity,
          yVelocity: particle.yPosition <= 0
              ? 1
              : particle.yPosition >= _size.height - particle.size * 24
                  ? -1
                  : particle.yVelocity,
        );
      }
      // if (timer.tick % 10 == 0) print(list);
      setState(() {
        _particles = list;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(),
          ..._particles.map<Widget>((e) => Obstacle(particle: e)).toList(),
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Text(
              'Level ${_player.level}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            child: Text(
              'Timer: ${_player.duration.format()}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Positioned(
            left: _player.xPosition,
            top: _player.yPosition,
            child: Draggable(
              child: const Spaceship(),
              feedback: const Spaceship(),
              childWhenDragging: const SizedBox(),
              onDragUpdate: (dragDetails) {
                setState(() {
                  _player = _player.copyWith(
                    xPosition: dragDetails.globalPosition.dx,
                    yPosition: dragDetails.globalPosition.dy,
                  );
                });
              },
              onDragEnd: (dragDetails) {
                setState(() {
                  _player = _player.copyWith(
                    xPosition: dragDetails.offset.dx,
                    yPosition: dragDetails.offset.dy,
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void gameOver() {
    print('Crashed');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ScorePage(player: _player)),
    );
  }
}
