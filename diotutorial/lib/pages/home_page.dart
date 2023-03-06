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

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  void getPosts() async {
    var p = await Service().getPosts();
    setState(() {
      posts = p;
    });
  }

  @override
  Widget build(BuildContext context) {
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
