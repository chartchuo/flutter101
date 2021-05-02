import 'package:flutter/material.dart';
import 'screen.dart';
import 'state.dart';
import 'path.dart';

class GameRouterDelegate extends RouterDelegate<GameRouterPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<GameRouterPath> {
  final GlobalKey<NavigatorState> _navigatorKey;
  final _games = gamesDB;
  var _gameRouterPath = GameRouterPath(RootPath.gameList);

  GameRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GameRouterPath get currentConfiguration => _gameRouterPath;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      pages: [
        MaterialPage(
            key: ValueKey('GamesListPage'),
            child: GamesListScreen(
              games: _games,
              onTapped: (id) {
                setNewRoutePath(GameRouterPath(RootPath.gameDetail, id));
              },
            )),
        if (_gameRouterPath.rootPath == RootPath.gameDetail)
          MaterialPage(
            key: ValueKey('Game${_gameRouterPath.id}'),
            child: GameDetailScreen(game: _games[_gameRouterPath.id!]),
          )
        else if (_gameRouterPath.rootPath == RootPath.unknown)
          MaterialPage(
            key: ValueKey('UnknownPage'),
            child: UnknownScreen(),
          )
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        setNewRoutePath(GameRouterPath(RootPath.gameList));
        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(GameRouterPath path) async {
    _gameRouterPath = path;

    if (path.rootPath == RootPath.gameDetail &&
        (path.id! < 0 || path.id! >= _games.length)) {
      _gameRouterPath = GameRouterPath(RootPath.unknown);
    }

    notifyListeners();
  }
}
