import 'package:cocktail/bloc/the_cocktail_db_provider.dart';
import 'package:cocktail/cocktail_db/drink.dart';

class CocktailRepository {
  final TheCocktailDbProvider provider;

  CocktailRepository(this.provider);

  Future<List<Drink>> searchData(String searchText) async {
    final data = await provider.searchData(searchText);
    return data;
  }

  // finter data

}
