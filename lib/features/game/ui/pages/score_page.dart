import 'package:asteroids/core/utils/extensions.dart';
import 'package:asteroids/features/game/models/player.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({
    Key? key,
    required this.player,
  }) : super(key: key);

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have lasted for ${player.duration.descriptive()}',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 16, width: double.infinity),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
