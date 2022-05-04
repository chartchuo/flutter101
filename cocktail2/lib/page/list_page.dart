import 'package:cocktail/cocktail_db/cocktail_db.dart';
import 'package:cocktail/page/detail_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListPageArgs {
  final String searchText;
  ListPageArgs(this.searchText);
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  CocktailDb cocktailDb = const CocktailDb();
  bool loaded = false;

  void loadData(String searchText) async {
    loaded = true;
    try {
      var url = Uri.https(
        'www.thecocktaildb.com',
        '/api/json/v1/1/search.php',
        {'s': searchText},
      );
      var r = await http.get(url);
      if (r.statusCode != 200) {
        if (kDebugMode) {
          print('Error');
        }
      }
      setState(() {
        cocktailDb = CocktailDb.fromJson(r.body);
      });
      if (kDebugMode) {
        print(cocktailDb);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ListPageArgs;
    if (!loaded) {
      loadData(args.searchText);
    }
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: cocktailDb.drinks
                ?.map((e) => ListTile(
                      leading: e.strDrinkThumb != null
                          ? Image.network(e.strDrinkThumb!)
                          : null,
                      title: Text(e.strDrink ?? 'No name'),
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: DetailPageArgs(e));
                      },
                    ))
                .toList() ??
            [],
      ),
    );
  }
}
