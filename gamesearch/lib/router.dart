import 'package:flutter/material.dart';
import 'screen/screen.dart';
import 'state.dart';
import 'model/model.dart';
import 'path.dart';

class GameRouterDelegate extends RouterDelegate<GameRouterPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<GameRouterPath> {
  final GlobalKey<NavigatorState> _navigatorKey;
  // final _games = gamesDB;
  final db = GamesDB();
  var _gameRouterPath = GameRouterPath(RootPath.search);

  MaterialPage gameListPage() {
    return MaterialPage(
        key: ValueKey('GamesListPage'),
        child: GamesListScreen(
          games: db.data ?? [],
          onTapped: (id) =>
              setNewRoutePath(GameRouterPath(RootPath.gameDetail, id)),
        ));
  }

  MaterialPage searchPage() {
    return MaterialPage(
        key: ValueKey('SearchPage'),
        child: SearchScreen(onSubmit: (String value) async {
          await db.search(value);
          setNewRoutePath(GameRouterPath(RootPath.gameList));
        }));
  }

  MaterialPage<String> gameDetailPage() {
    return MaterialPage<String>(
      key: ValueKey('Game${_gameRouterPath.id}'),
      maintainState: false,
      child: GameDetailScreen(game: db.data?[_gameRouterPath.id!] ?? Game()),
    );
  }

  MaterialPage unknownPage() {
    return MaterialPage(
      key: ValueKey('UnknownPage'),
      child: UnknownScreen(),
    );
  }

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
        print('Pop value $result');
        return route.didPop(result);
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(GameRouterPath path) async {
    _gameRouterPath = path;

    if (path.rootPath == RootPath.gameDetail &&
        (path.id! < 0 || path.id! >= (db.data?.length ?? 0))) {
      _gameRouterPath = GameRouterPath(RootPath.unknown);
    }

    notifyListeners();
  }
}
