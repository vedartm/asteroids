import 'package:asteroids/features/game/ui/pages/game_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Asteroids', style: Theme.of(context).textTheme.headline3),
          const SizedBox(height: 16, width: double.infinity),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GamePage()),
            ),
            child: const Text('Launch your shuttle'),
          ),
        ],
      ),
    );
  }
}
