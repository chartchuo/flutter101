import 'package:flutter/material.dart';
import 'router.dart';

void main() {
  runApp(MaterialApp.router(
    routeInformationParser: GameRouteInformationParser(),
    routerDelegate: GameRouterDelegate(),
  ));
}
