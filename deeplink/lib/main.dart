import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Char {
  final String id;
  final String name;
  final String sname;

  Char(this.id, this.name, this.sname);
}

List<Char> chars = [
  Char('1', 'Cloud', 'Strife'),
  Char('2', 'Barret', 'Wallance'),
  Char('3', 'Tifa', 'Lockhart'),
  Char('4', 'Aerith', 'Gainsborough'),
];

void main(List<String> args) {
  final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/char/:id',
      builder: (context, state) {
        var id = state.params['id'];
        var ch = chars.firstWhere((e) => e.id == id);
        return CharPage(ch);
      },
    )
  ]);
  runApp(MaterialApp.router(
    routeInformationParser: router.routeInformationParser,
    routerDelegate: router.routerDelegate,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: chars
            .map((e) => ListTile(
                  title: Text(e.name),
                  onTap: () {
                    GoRouter.of(context).go('/char/${e.id}');
                  },
                ))
            .toList(),
      ),
    );
  }
}

class CharPage extends StatelessWidget {
  final Char ch;
  const CharPage(
    this.ch, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${ch.id}. ${ch.name} ${ch.sname}'),
      ),
    );
  }
}
