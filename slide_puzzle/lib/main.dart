import 'package:flutter/material.dart';
import 'package:slide_puzzle/model.dart';

void main() {
  runApp(MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var board = SlideBoard()..shuffle();
  bool solved = false;
  bool easyMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slide Puzzle'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ToggleButtons(
                  children: [Text('Easy')],
                  isSelected: [easyMode],
                  onPressed: (_) {
                    setState(() {
                      easyMode = !easyMode;
                    });
                  },
                ),
                TextButton.icon(
                  icon: Icon(Icons.restart_alt),
                  label: Text('Restart'),
                  onPressed: () {
                    setState(() {
                      board = SlideBoard()..shuffle();
                      solved = false;
                    });
                  },
                ),
              ],
            ),
            Spacer(),
            LimitedBox(
              maxWidth: 400,
              maxHeight: 400,
              child: Container(
                padding: EdgeInsets.all(2),
                color: Colors.grey,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: [
                      ...board.tiles.map((e) => Tile(
                            e.row,
                            e.col,
                            e.number,
                            onTap: () {
                              if (solved) return;
                              setState(() {
                                if (easyMode)
                                  board.move(e.row, e.col);
                                else
                                  board.tap(e.row, e.col);
                                if (board.solved()) {
                                  _showMyDialog();
                                  solved = true;
                                }
                              });
                            },
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
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
  final int row, col;
  final int number;
  final GestureTapCallback? onTap;
  const Tile(this.row, this.col, this.number, {this.onTap});

  @override
  Widget build(BuildContext context) {
    if (number == 0) {
      return Container();
    }
    return AnimatedAlign(
      key: Key('tile' + number.toRadixString(16)),
      alignment: FractionalOffset(col / 3, row / 3),
      duration: Duration(milliseconds: 200),
      child: FractionallySizedBox(
        widthFactor: .25,
        heightFactor: .25,
        child: GestureDetector(
          onTap: onTap,
          child: SizedBox.expand(
            child: Card(
              margin: EdgeInsets.all(2),
              child: Center(
                child: Text(
                  '$number',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
