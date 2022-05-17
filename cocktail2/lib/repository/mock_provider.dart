import 'package:cocktail/cocktail_db/drink.dart';
import 'package:cocktail/repository/provider.dart';

class MockProvider extends Provider {
  @override
  Future<List<Drink>> searchData(String searchText) async {
    return List<Drink>.generate(
      100,
      (index) => Drink(
        strDrink: 'Drink $index',
        strCategory: 'Category ${index % 10}',
        strDrinkThumb: 'https://picsum.photos/id/$index/200/300',
      ),
    );
  }
}
