import 'package:cocktail/cocktail_db/cocktail_db.dart';
import 'package:cocktail/cocktail_db/drink.dart';
import 'package:cocktail/repository/provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class TheCocktailDbProvider extends Provider {
  @override
  Future<List<Drink>> searchData(String searchText) async {
    try {
      var url = Uri.https(
        'www.thecocktaildb.com',
        '/api/json/v1/1/search.php',
        {'s': searchText},
      );
      // var r = await http.get(url);
      // if (r.statusCode != 200) {
      //   if (kDebugMode) {
      //     print('Error');
      //   }
      // }
      // var drinks = CocktailDb.fromJson(r.body).drinks;
      // if (drinks == null) {
      //   throw Exception('no drinks found');
      // }
      var file = await DefaultCacheManager().getSingleFile(url.toString());
      var drinks = CocktailDb.fromJson(file.readAsStringSync()).drinks;
      if (drinks == null) {
        throw Exception('no drinks found');
      }
      return (drinks);
    } catch (e) {
      throw Exception('API access fiail');
    }
  }
}
