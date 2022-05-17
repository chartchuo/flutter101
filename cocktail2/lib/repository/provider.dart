import 'package:cocktail/cocktail_db/drink.dart';

abstract class Provider {
  Future<List<Drink>> searchData(String searchText);
}
