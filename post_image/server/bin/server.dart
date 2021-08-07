import 'dart:convert';
import 'dart:io';

import 'package:dart_nats/dart_nats.dart';
import 'package:mime/mime.dart';

void n() async {
  const dir = './upload';
  if (!Directory(dir).existsSync()) {
    await Directory(dir).create();
  }
  var nuid = Nuid();

  var server = await HttpServer.bind('localhost', 8085);
  server.listen((request) {
    if (request.uri.path == '/upload') {
      var boundary = request.headers.contentType!.parameters['boundary'];
      if (request.method != 'POST' || boundary == null) {
        request.response.statusCode = 400;
        request.response.close();
        return;
      }
      var filenames = <String>[];
      final transformer = MimeMultipartTransformer(boundary);

      transformer.bind(request).listen((part) async {
        final content = await part.toList();
        var filename = nuid.next();
        filenames.add(filename);
        print(filenames);
        await File('$dir/$filename.jpg').writeAsBytes(content[0]);
      }).onDone(() {
        var json = filenames.map((e) => {'filename': e}).toList();
        request.response.write(jsonEncode(json));
        print('CLOSE');
        request.response.close();
      });
    }
  });
}

void main() async {
  const dir = './upload';
  if (!Directory(dir).existsSync()) {
    await Directory(dir).create();
  }
  var nuid = Nuid();

  var server = await HttpServer.bind('localhost', 8085);
  server.listen((request) async {
    if (request.uri.path == '/upload') {
      var boundary = request.headers.contentType!.parameters['boundary'];
      if (request.method != 'POST' || boundary == null) {
        request.response.statusCode = 400;
        await request.response.close();
        return;
      }
      var filenames = <String>[];
      final transformer = MimeMultipartTransformer(boundary);

      final parts = await transformer.bind(request).toList();

      for (var part in parts) {
        final content = await part.toList();

        var filename = nuid.next();
        await File('$dir/$filename.jpg').writeAsBytes(content[0]);

        filenames.add(filename);
      }
      var json = filenames.map((e) => {'filename': e}).toList();
      request.response.write(jsonEncode(json));
      await request.response.close();
    }
  });
}
