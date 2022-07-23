import 'package:cocktail/cocktail_db/drink.dart';
import 'package:flutter/material.dart';

import 'cache_image.dart';

class DetailPageArgs {
  final Drink drink;
  DetailPageArgs(this.drink);
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailPageArgs;
    final drink = args.drink;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text(drink.strDrink ?? 'No name'),
          CacheImage(
            drink.strDrinkThumb ??
                'https://www.thecocktaildb.com/images/logo.png',
          ),
        ],
      ),
    );
  }
}
