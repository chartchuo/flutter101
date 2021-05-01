import 'package:flutter/material.dart';

import 'model.dart';

class GamesListScreen extends StatelessWidget {
  final List<Game> games;
  final ValueChanged<int> onTapped;

  const GamesListScreen({
    Key? key,
    required this.games,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(games[index].title),
            subtitle: Text(games[index].developer),
            onTap: () {
              onTapped(index);
            },
          );
        },
      ),
    );
  }
}

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

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('Unknown'),
        ],
      ),
    );
  }
}
