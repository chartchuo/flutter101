import 'package:flutter/material.dart';
import 'screen.dart';
import 'state.dart';

class GameRouterPath {
  final int? id; // id == null -> home page
  final bool isUnknown;

  GameRouterPath()
      : id = null,
        isUnknown = false;

  GameRouterPath.home()
      : id = null,
        isUnknown = false;

  GameRouterPath.detail(this.id) : isUnknown = false;

  GameRouterPath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHome => id == null;
  bool get isDetail => id != null;
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
      return;
    }
    if (path.isDetail && path.id! >= 0 && path.id! < _games.length) {
      _gameRouterPath = GameRouterPath.detail(path.id);
      return;
    }

    _gameRouterPath = GameRouterPath.unknown();
  }
}
