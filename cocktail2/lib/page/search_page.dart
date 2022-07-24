import 'package:cocktail/bloc/cocktail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var textCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter 107')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: textCtrl),
          ElevatedButton(
            child: const Text('Search'),
            onPressed: () {
              BlocProvider.of<CocktailBloc>(context)
                  .add(SearchEvent(textCtrl.text));
              Navigator.pushNamed(context, '/list');
            },
          ),
          TextButton(
            child: const Text('Search'),
            onPressed: () {
              BlocProvider.of<CocktailBloc>(context)
                  .add(SearchEvent(textCtrl.text));
              Navigator.pushNamed(context, '/list');
            },
          ),
          OutlinedButton(
            child: const Text('Search'),
            onPressed: () {
              BlocProvider.of<CocktailBloc>(context)
                  .add(SearchEvent(textCtrl.text));
              Navigator.pushNamed(context, '/list');
            },
          ),
        ],
      ),
    );
  }
}
