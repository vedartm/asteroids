import 'package:flutter/material.dart';

class Spaceship extends StatelessWidget {
  const Spaceship({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
