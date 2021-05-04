import 'model/model.dart';
import 'package:http/http.dart' as http;
import 'model/games-api.dart';

// List<Game> gamesDB = [
//   Game('FF7', 'Square Enix'),
//   Game('Star Walrs Jedi fallen Order', 'EA'),
//   Game('Shadow of the Tomb Raider', 'Edios'),
// ];

class GamesDB {
  List<Game>? _data;

  List<Game>? get data => _data;

  Future search(String str) async {
    var response = await http.get(Uri.https(
      'api.rawg.io',
      '/api/games',
      {
        'key': 'd2ba6a29ec59444ea3f5dca0b75ee9a4',
        'search': str,
      },
    ));

    if (response.statusCode == 200) {
      var result = gameListResultFromJson(response.body);
      _data = result.results
          ?.map((e) => Game(e.name ?? '', e.released?.year.toString() ?? '',
              e.backgroundImage))
          .toList();
    }
  }
}
