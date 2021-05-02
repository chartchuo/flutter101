import 'package:flutter/material.dart';

import '../model.dart';

class GameDetailScreen extends StatelessWidget {
  final Game game;

  const GameDetailScreen({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(game.title),
          Text(game.developer),
        ],
      ),
    );
  }
}
