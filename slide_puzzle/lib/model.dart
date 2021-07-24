import 'dart:math';

class BoardTile {
  int row, col;
  int number;

  BoardTile(this.row, this.col, this.number);
}

class SlideBoard {
  late List<BoardTile> tiles;

  SlideBoard() {
    tiles = List.generate(16, (i) {
      if (i == 0) return BoardTile(3, 3, 0); //blank tile
      return BoardTile((i - 1) % 4, (i - 1) ~/ 4, i);
    });
  }

  //move swap with blank
  void move(int row, col) {
    for (var i = 1; i < 16; i++) {
      if (tiles[i].row == row && tiles[i].col == col) {
        tiles[i].row = tiles[0].row;
        tiles[i].col = tiles[0].col;
        tiles[0].row = row;
        tiles[0].col = col;
        return;
      }
    }
  }

  tap(int row, int col) {
    if (row == tiles[0].row) {
      if (tiles[0].col < col)
        for (var i = tiles[0].col + 1; i <= col; i++) move(row, i);

      if (tiles[0].col > col)
        for (var i = tiles[0].col - 1; i >= col; i--) move(row, i);
    } else if (col == tiles[0].col) {
      if (tiles[0].row < row)
        for (var i = tiles[0].row + 1; i <= row; i++) move(i, col);

      if (tiles[0].row > row)
        for (var i = tiles[0].row - 1; i >= row; i--) move(i, col);
    }
  }

  shuffle([int time = 1000]) {
    for (var i = 0; i < time; i++) {
      tap(tiles[0].row, Random().nextInt(4));
      tap(Random().nextInt(4), tiles[0].col);
    }
  }

  List<BoardTile> toList() => tiles;

  bool solved() {
    if (tiles[0].row != 3) return false;
    if (tiles[0].col != 3) return false;
    for (var i = 1; i < 16; i++) {
      if (tiles[i].row != (i - 1) ~/ 4) return false;
      if (tiles[i].col != (i - 1) % 4) return false;
    }

    return true;
  }
}
