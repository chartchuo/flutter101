import 'package:diotutorial/api.dart';
import 'package:diotutorial/models/post.dart';
import 'package:fpdart/fpdart.dart';

class Service {
  static final _singleton = Service._internal();
  factory Service() => _singleton;

  Service._internal();

  Future<Either<List<Post>, String>> getPosts() async {
    try {
      var response = await Api().dio.get<String>('/posts');
      return left(postFromJson(response.data ?? ''));
    } catch (e) {
      return right(e.toString());
    }
  }
}
