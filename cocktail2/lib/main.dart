import 'package:cocktail/bloc/cocktail_bloc.dart';
import 'package:cocktail/page/detail_page.dart';
import 'package:cocktail/page/list_page.dart';
import 'package:cocktail/page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(BlocProvider(
    create: (context) => CocktailBloc(),
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SearchPage(),
        '/list': (context) => const ListPage(),
        '/detail': (context) => const DetailPage(),
      },
    ),
  ));
}
