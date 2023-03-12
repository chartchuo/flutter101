import 'package:diotutorial/api.dart';
import 'package:diotutorial/models/post.dart';


class Service {
  static final _singleton = Service._internal();
  factory Service() => _singleton;

  Service._internal();

  // (List<Post>,String?)
  Future<(List<Post>,String?)> getPosts() async {
    try {
      var response = await Api().dio.get<String>('/posts');
      return (postFromJson(response.data ?? ''),null);
    } catch (e) {
      return (List<Post>[],e.toString());
    }
  }
}
