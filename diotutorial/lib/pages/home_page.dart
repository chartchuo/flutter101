import 'package:diotutorial/models/post.dart';
import 'package:diotutorial/service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [];
  String? error;

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  void getPosts() async {
    var (rPosts, rError) = await Service().getPosts();
    setState(() {
      posts = rPosts;
      error = rError;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return errorBuild(error!);
    }
    return normalBuild(posts);
  }

  Scaffold errorBuild(String err) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(err),
          ElevatedButton(
              onPressed: () => getPosts(), child: const Text('Reload')),
        ],
      )),
    );
  }

  Scaffold normalBuild(List<Post> posts) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(posts[index].title),
          );
        },
      ),
    );
  }
}
