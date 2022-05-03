import 'package:cocktail/cocktail_db/cocktail_db.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(const MaterialApp(home: MyHome()));
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var url = Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita');
    var r = await http.get(url);
    if (r.statusCode != 200) {
      if (kDebugMode) {
        print('Error');
      }
    }
    CocktailDb cocktailDb = CocktailDb.fromJson(r.body);
    if (kDebugMode) {
      print(cocktailDb);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
