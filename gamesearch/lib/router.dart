import 'package:flutter/material.dart';
import 'screen.dart';
import 'state.dart';

enum GameRootPath { home, unknown, detail }

class GameRouterPath {
  final GameRootPath _gameRootPath;
  final int? _id;

  GameRouterPath.home()
      : _gameRootPath = GameRootPath.home,
        _id = null;

  GameRouterPath.detail(this._id) : _gameRootPath = GameRootPath.detail;

  GameRouterPath.unknown()
      : _gameRootPath = GameRootPath.unknown,
        _id = null;

  bool get isHome => _gameRootPath == GameRootPath.home;
  bool get isDetail => _gameRootPath == GameRootPath.detail;
  bool get isUnknown => _gameRootPath == GameRootPath.unknown;
  int? get id => _gameRootPath == GameRootPath.detail ? _id : null;
}

class GameRouteInformationParser
    extends RouteInformationParser<GameRouterPath> {
  @override
  Future<GameRouterPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    var uri = Uri.parse(routeInformation.location ?? '/');

    // handle home
    if (uri.pathSegments.length == 0) {
      return GameRouterPath.home();
    }

    //detail hendle '/game/:id'
    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'game') {
      var id = int.tryParse(uri.pathSegments[1]);
      if (id == null) return GameRouterPath.unknown();
      return GameRouterPath.detail(id);
    }

    return GameRouterPath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(GameRouterPath path) {
    if (path.isHome) return RouteInformation(location: '/');

    if (path.isDetail) return RouteInformation(location: '/game/${path.id}');

    if (path.isUnknown) return RouteInformation(location: '/unknown');
    return null;
  }
}

class GameRouterDelegate extends RouterDelegate<GameRouterPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<GameRouterPath> {
  final GlobalKey<NavigatorState> _navigatorKey;
  final _games = gamesDB;
  var _gameRouterPath = GameRouterPath.home();

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
                _gameRouterPath = GameRouterPath.detail(id);
                notifyListeners();
              },
            )),
        if (_gameRouterPath.isDetail)
          MaterialPage(
            key: ValueKey('Game${_gameRouterPath.id}'),
            child: GameDetailScreen(game: _games[_gameRouterPath.id!]),
          )
        else if (_gameRouterPath.isUnknown)
          MaterialPage(
            key: ValueKey('UnknownPage'),
            child: UnknownScreen(),
          )
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        _gameRouterPath = GameRouterPath.home();
        notifyListeners();
        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(GameRouterPath path) async {
    if (path.isHome) {
      _gameRouterPath = GameRouterPath.home();
      notifyListeners();
      return;
    }
    if (path.isDetail && path.id! >= 0 && path.id! < _games.length) {
      _gameRouterPath = GameRouterPath.detail(path.id);
      notifyListeners();
      return;
    }

    _gameRouterPath = GameRouterPath.unknown();
    notifyListeners();
  }
}
