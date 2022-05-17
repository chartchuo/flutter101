import 'package:cocktail/cocktail_db/drink.dart';
import 'package:cocktail/repository/provider.dart';

class CocktailRepository {
  final Provider provider;
  List<Drink> rawData = [];

  CocktailRepository(this.provider);

  Future<List<Drink>> searchData(String searchText) async {
    rawData = await provider.searchData(searchText);

    return rawData;
  }

  List<Drink> filter(String? filter) {
    if (filter == null) {
      return rawData;
    }
    return rawData.where((e) => e.strCategory == filter).toList();
  }
}
