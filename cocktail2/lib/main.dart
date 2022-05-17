import 'package:cocktail/bloc/cocktail_bloc.dart';
import 'package:cocktail/page/detail_page.dart';
import 'package:cocktail/page/list_page.dart';
import 'package:cocktail/page/search_page.dart';
import 'package:cocktail/repository/cocktail_repository.dart';
import 'package:cocktail/repository/mock_provider.dart';
import 'package:cocktail/repository/provider.dart';
import 'package:cocktail/repository/the_cocktail_db_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  Provider provider;
  if (kDebugMode) {
    provider = MockProvider();
  } else {
    provider = TheCocktailDbProvider();
  }
  runApp(BlocProvider(
    create: (context) => CocktailBloc(CocktailRepository(provider)),
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
