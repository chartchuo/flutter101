import 'dart:math';

class BoardTile {
  final int row, col;
  final int number;

  BoardTile(this.row, this.col, this.number);
}

class SlideBoard {
  int blankRow = 3;
  int blankCol = 3;
  var data = List.generate(4, (i) => List.filled(4, 0, growable: false),
      growable: false);

  SlideBoard() {
    //fill data into array 0=>empty
    var number = 1;
    for (var row = 0; row < 4; row++) {
      for (var col = 0; col < 4; col++) {
        data[row][col] = number;
        number += 1;
      }
    }
    data[3][3] = 0;
  }

  tap(int row, int col) {
    if (row == blankRow) {
      if (blankCol < col)
        for (var i = blankCol; i < col; i++) data[row][i] = data[row][i + 1];

      if (blankCol > col)
        for (var i = blankCol; i > col; i--) data[row][i] = data[row][i - 1];

      blankCol = col;
    } else if (col == blankCol) {
      if (blankRow < row)
        for (var i = blankRow; i < row; i++) data[i][col] = data[i + 1][col];

      if (blankRow > row)
        for (var i = blankRow; i > row; i--) data[i][col] = data[i - 1][col];

      blankRow = row;
    }
    data[blankRow][blankCol] = 0;
  }

  @override
  String toString() {
    var str = '';
    for (var row = 0; row < 4; row++)
      for (var col = 0; col < 4; col++)
        str = str + data[row][col].toRadixString(16);

    return str;
  }

  shuffle([int time = 1000]) {
    for (var i = 0; i < time; i++) {
      tap(blankRow, Random().nextInt(4));
      tap(Random().nextInt(4), blankCol);
    }
  }

  List<BoardTile> toList() {
    List<BoardTile> e = [];
    for (var row = 0; row < 4; row++)
      for (var col = 0; col < 4; col++)
        e.add(BoardTile(row, col, data[row][col]));

    e.sort((a, b) => a.number.compareTo(b.number));
    return e;
  }

  bool solved() {
    return toString() == '123456789abcdef0';
  }
}
