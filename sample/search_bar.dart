import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
              margin: EdgeInsets.all(5),
              child: SearchBar(
                onSearch: (text) {
                  print(text);
                },
              )),
        ],
      ),
      body: Center(
        child: SearchBar(
          onSearch: (text) {
            print(text);
          },
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final Function(String) onSearch;
  const SearchBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  var expanded = false;
  final width = 200.0;
  final height = 50.0;
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height / 2),
        color: expanded ? Colors.black12 : Colors.transparent,
      ),
      width: expanded ? width : height,
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: height,
            height: height,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                icon: Icon(Icons.search)),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: expanded ? width - height - height / 2 : 0,
            height: height,
            child: TextField(
              focusNode: focusNode,
              controller: controller,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              onEditingComplete: () {
                widget.onSearch(controller.text);
                controller.clear();
                setState(() {
                  expanded = false;
                });
              },
            ),
            onEnd: () {
              if (expanded) {
                focusNode.requestFocus();
              } else {
                focusNode.unfocus();
              }
            },
          ),
        ],
      ),
    );
  }
}
