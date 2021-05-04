import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final ValueChanged<String> onSubmit;

  const SearchScreen({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchString = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            autofocus: true,
            initialValue: searchString,
            onChanged: (str) => searchString = str,
          ),
          ElevatedButton(
            child: Text('Search'),
            onPressed: () {
              widget.onSubmit(searchString);
            },
          ),
        ],
      ),
    );
  }
}
