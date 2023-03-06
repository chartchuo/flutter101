import 'package:diotutorial/api.dart';
import 'package:diotutorial/models/post.dart';

class Service {
  static final _singleton = Service._internal();
  factory Service() => _singleton;

  Service._internal();

  Future<List<Post>> getPosts() async {
    var response = await Api().dio.get<String>('/posts');
    return postFromJson(response.data ?? '');
  }
}
