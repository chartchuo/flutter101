import 'dart:math';

class BoardTile {
  int row, col, number;
  BoardTile(this.row, this.col, this.number);
}

class SlideBoard {
  List<BoardTile> tiles = [];
  SlideBoard() {
    tiles.add(BoardTile(3, 3, 0)); //Empty tile
    for (var i = 1; i < 16; i++)
      tiles.add(BoardTile((i - 1) ~/ 4, (i - 1) % 4, i));
  }

  BoardTile getTile(int row, col) {
    for (var i = 0; i < 16; i++)
      if (tiles[i].row == row && tiles[i].col == col) return tiles[i];
    throw ('Error not found');
  }

  @override
  String toString() {
    var str = '';
    for (var row = 0; row < 4; row++) {
      for (var col = 0; col < 4; col++) {
        str = str + getTile(row, col).number.toRadixString(16);
      }
      str = str + '\n';
    }
    return str;
  }

  void move(int row, col) {
    var t = getTile(row, col);
    t.row = tiles[0].row;
    t.col = tiles[0].col;
    tiles[0].row = row;
    tiles[0].col = col;
  }

  void slide(int row, col) {
    if (tiles[0].row == row && tiles[0].col == col)
      return;
    else if (tiles[0].row == row) {
      if (tiles[0].col > col) {
        for (var i = tiles[0].col - 1; i >= col; i--) move(row, i);
      } else if (tiles[0].col < col) {
        for (var i = tiles[0].col + 1; i <= col; i++) move(row, i);
      }
    } else if (tiles[0].col == col) {
      if (tiles[0].row > row) {
        for (var i = tiles[0].row - 1; i >= row; i--) move(i, col);
      } else if (tiles[0].row < row) {
        for (var i = tiles[0].row + 1; i <= row; i++) move(i, col);
      }
    }
  }

  void shuffle() {
    for (var i = 0; i < 1000; i++) {
      slide(tiles[0].row, Random().nextInt(4));
      slide(Random().nextInt(4), tiles[0].col);
    }
  }

  bool isSolved() {
    if (tiles[0].row != 3 || tiles[0].col != 3) return false;
    for (var i = 1; i < 16; i++)
      if (tiles[i].row != (i - 1) ~/ 4 || tiles[i].col != (i - 1) % 4)
        return false;
    return true;
  }
}
