import 'package:cocktail/cocktail_db/cocktail_db.dart';
import 'package:cocktail/page/detail_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListPage extends StatefulWidget {
  final String searchText;
  const ListPage(this.searchText, {Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  CocktailDb cocktailDb = const CocktailDb();
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    try {
      // var url = Uri.parse(
      //     'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=${widget.searchText}');
      var url = Uri.https(
        'www.thecocktaildb.com',
        '/api/json/v1/1/search.php',
        {'s': widget.searchText},
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(e),
                            ));
                      },
                    ))
                .toList() ??
            [],
      ),
    );
  }
}
