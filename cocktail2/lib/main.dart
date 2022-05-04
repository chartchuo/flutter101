import 'package:cocktail/page/detail_page.dart';
import 'package:cocktail/page/list_page.dart';
import 'package:cocktail/page/search_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const SearchPage(),
      '/list': (context) => const ListPage(),
      '/detail': (context) => const DetailPage(),
    },
  ));
}
