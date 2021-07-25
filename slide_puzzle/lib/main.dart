import 'package:flutter/material.dart';
import 'package:slide_puzzle/model.dart';

void main() {
  var board = SlideBoard();
  print(board.isSolved());
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var board = SlideBoard()..shuffle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slide Puzzle'), centerTitle: true),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      board = SlideBoard()..shuffle();
                    });
                  },
                  child: Text('Shuffle'))
            ],
          ),
          Spacer(),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: Colors.grey,
              child: Stack(
                children: board.tiles
                    .map((t) => Tile(
                          t.row,
                          t.col,
                          t.number,
                          onTap: () {
                            if (board.isSolved()) return;
                            setState(() {
                              board.slide(t.row, t.col);
                            });
                            if (board.isSolved()) _showMyDialog();
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Solved'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Tile extends StatelessWidget {
  final int row, col, number;
  final void Function()? onTap;
  const Tile(this.row, this.col, this.number, {this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (number == 0) return Container();
    return AnimatedAlign(
      alignment: FractionalOffset(col * 1 / 3, row * 1 / 3),
      duration: Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: onTap,
        child: FractionallySizedBox(
          heightFactor: 1 / 4,
          widthFactor: 1 / 4,
          child: Card(
            color: Colors.white,
            child: Center(
                child: Text(
              number.toString(),
              style: TextStyle(fontSize: 24),
            )),
          ),
        ),
      ),
    );
  }
}
