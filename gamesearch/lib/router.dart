import 'package:flutter/material.dart';
import 'screen/screen.dart';
import 'state.dart';
import 'path.dart';

class GameRouterDelegate extends RouterDelegate<GameRouterPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<GameRouterPath> {
  final GlobalKey<NavigatorState> _navigatorKey;
  final _games = gamesDB;
  var _gameRouterPath = GameRouterPath(RootPath.search);

  MaterialPage gameListPage() => MaterialPage(
      key: ValueKey('GamesListPage'),
      child: GamesListScreen(
        games: _games,
        onTapped: (id) =>
            setNewRoutePath(GameRouterPath(RootPath.gameDetail, id)),
      ));
  MaterialPage searchPage() => MaterialPage(
      key: ValueKey('SearchPage'),
      child: SearchScreen(
        onSubmit: (String value) =>
            setNewRoutePath(GameRouterPath(RootPath.gameList)),
      ));
  MaterialPage gameDetailPage() => MaterialPage(
        key: ValueKey('Game${_gameRouterPath.id}'),
        child: GameDetailScreen(game: _games[_gameRouterPath.id!]),
      );
  MaterialPage unknownPage() => MaterialPage(
        key: ValueKey('UnknownPage'),
        child: UnknownScreen(),
      );

  GameRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GameRouterPath get currentConfiguration => _gameRouterPath;

  @override
  Widget build(BuildContext context) {
    List<Page> pageStack;
    switch (_gameRouterPath.rootPath) {
      case RootPath.search:
        pageStack = [searchPage()];
        break;
      case RootPath.gameList:
        pageStack = [searchPage(), gameListPage()];
        break;
      case RootPath.gameDetail:
        pageStack = [searchPage(), gameListPage(), gameDetailPage()];
        break;
      case RootPath.unknown:
        pageStack = [unknownPage()];
        break;
    }

    return Navigator(
      key: _navigatorKey,
      pages: pageStack,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;

        if (_gameRouterPath.rootPath == RootPath.gameDetail)
          setNewRoutePath(GameRouterPath(RootPath.gameList));
        else if (_gameRouterPath.rootPath == RootPath.gameList)
          setNewRoutePath(GameRouterPath(RootPath.search));
        else
          setNewRoutePath(GameRouterPath(RootPath.search));
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
