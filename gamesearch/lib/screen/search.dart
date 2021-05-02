import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final ValueChanged<String> onSubmit;

  const SearchScreen({Key? key, required this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FloatingActionButton(
            onPressed: () {
              onSubmit('');
            },
          ),
        ],
      ),
    );
  }
}
