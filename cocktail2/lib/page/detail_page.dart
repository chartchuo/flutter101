import 'package:cocktail/cocktail_db/drink.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Drink drink;
  const DetailPage(this.drink, {Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text(widget.drink.strDrink ?? 'No name'),
          Image.network(
            widget.drink.strDrinkThumb ??
                'https://www.thecocktaildb.com/images/logo.png',
          ),
        ],
      ),
    );
  }
}
