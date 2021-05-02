import 'package:flutter/material.dart';

enum RootPath {
  gameList,
  unknown,
  gameDetail,
}

class GameRouterPath {
  final RootPath rootPath;
  final int? id;

  GameRouterPath(this.rootPath, [this.id]);
}

class GameRouteInformationParser
    extends RouteInformationParser<GameRouterPath> {
  @override
  Future<GameRouterPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    var uri = Uri.parse(routeInformation.location ?? '/');

    // handle home
    if (uri.pathSegments.length == 0) {
      return GameRouterPath(RootPath.gameList);
    }

    //detail hendle '/game/:id'
    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'game') {
      var id = int.tryParse(uri.pathSegments[1]);
      return GameRouterPath(RootPath.gameDetail, id);
    }

    return GameRouterPath(RootPath.unknown);
  }

  @override
  RouteInformation? restoreRouteInformation(GameRouterPath path) {
    if (path.rootPath == RootPath.gameList)
      return RouteInformation(location: '/');

    if (path.rootPath == RootPath.gameDetail)
      return RouteInformation(location: '/game/${path.id}');

    if (path.rootPath == RootPath.unknown)
      return RouteInformation(location: '/unknown');
    return null;
  }
}
