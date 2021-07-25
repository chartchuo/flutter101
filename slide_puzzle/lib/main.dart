import 'package:flutter/material.dart';
import 'package:slide_puzzle/model.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var board = SlideBoard()..shuffle();
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
                  label: Text('Shuffle'),
                  onPressed: () {
                    setState(() {
                      board = SlideBoard()..shuffle();
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
                            key: ValueKey(e.number),
                            onTap: () {
                              if (board.isSolved()) return;
                              setState(() {
                                if (easyMode)
                                  board.move(e.row, e.col);
                                else
                                  board.slide(e.row, e.col);
                              });
                              if (board.isSolved()) {
                                _showMyDialog();
                              }
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
  const Tile(this.row, this.col, this.number, {this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (number == 0) {
      return Container();
    }
    return AnimatedAlign(
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
