import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CacheImage extends StatelessWidget {
  final String url;
  const CacheImage(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var futureFile = DefaultCacheManager().getSingleFile(url);

    return FutureBuilder<File>(
      future: futureFile,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Image.file(snapshot.data!);
        }
        return const SizedBox(width: 1, height: 1);
      },
    );
  }
}
