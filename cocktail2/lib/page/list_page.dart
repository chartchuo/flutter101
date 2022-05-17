import 'package:cocktail/bloc/cocktail_bloc.dart';
import 'package:cocktail/page/detail_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CocktailBloc, CocktailState>(
      listener: (context, state) async {
        if (state is CocktailError) {
          if (kDebugMode) {
            print(state.message);
          }
          await _showMyDialog(context, state.message);
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<CocktailBloc, CocktailState>(
        builder: (context, state) {
          if (state is CocktailLoading || state is CocktailInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CocktailFinishState) {
            return Scaffold(
              appBar: AppBar(),
              body: ListView(
                children: state.drinks
                    .map((e) => ListTile(
                          leading: e.strDrinkThumb != null
                              ? Image.network(e.strDrinkThumb!)
                              : null,
                          title: Text(e.strDrink ?? 'No name'),
                          onTap: () {
                            Navigator.pushNamed(context, '/detail',
                                arguments: DetailPageArgs(e));
                          },
                        ))
                    .toList(),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context, String message) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
