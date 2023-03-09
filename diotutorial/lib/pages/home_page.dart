import 'package:diotutorial/models/post.dart';
import 'package:diotutorial/service.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' show Either, Left;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Either<List<Post>, String> result = const Left([]);

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  void getPosts() async {
    var r = await Service().getPosts();
    setState(() {
      result = r;
    });
  }

  @override
  Widget build(BuildContext context) {
    return result.fold<Widget>((l) {
      return Scaffold(
        body: ListView.builder(
          itemCount: l.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(l[index].title),
            );
          },
        ),
      );
    }, (r) {
      return Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(r),
            ElevatedButton(
                onPressed: () => getPosts(), child: const Text('Reload')),
          ],
        )),
      );
    });
  }
}
