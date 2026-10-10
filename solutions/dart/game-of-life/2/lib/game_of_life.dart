class GameOfLife {
  List<List<int>> _cellMatrix;

  // Safely deep-copy the initial cell matrix upon instantiation
  GameOfLife(List<List<int>> initialCellMatrix)
    : _cellMatrix = initialCellMatrix.map((row) => List<int>.from(row)).toList();
    
  /// Returns the current state of the cell matrix as a deep copy.
  List<List<int>> matrix() {
    return _cellMatrix.map((row) => List<int>.from(row)).toList();
  }

  int get rowCount => _cellMatrix.length;
  int get columnCount => _cellMatrix.isNotEmpty ? _cellMatrix[0].length : 0;

  /// advances the cell lives to the next generation
  void tick() {

    final nextGenCellMatrix = <List<int>>[];

    for (int i = 0; i < rowCount; i++) {
      final newCellMatrixRow = <int>[];
      for (int j = 0; j < columnCount; j++) {
        final liveNeighborCount = _getLiveNeighborCount(i, j);
        final isCellAlive = _cellMatrix[i][j] == 1;

        /* 
        It’s the four Game of Life rules compressed into one expression. The key is to ask: 
        which situations result in a live cell next generation? There are only two.
        1. Exactly 3 live neighbors, regardless of whether the cell is currently alive or dead. 
          A live cell with 3 neighbors survives, and a dead cell with 3 neighbors is born.
        2. Exactly 2 live neighbors, but only if the cell is already alive. 
          A live cell with 2 neighbors survives, but a dead cell with 2 neighbors stays dead.
         */
        newCellMatrixRow.add((liveNeighborCount == 3 || (isCellAlive && liveNeighborCount == 2)) ? 1 : 0);
      }
      nextGenCellMatrix.add(newCellMatrixRow);
    }

    _cellMatrix = nextGenCellMatrix;
  }

  int _getLiveNeighborCount(int row, int column) {
    int liveNeighborCount = 0;
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (i == 0 && j == 0) continue;

        int neighborRow = row + i, neighborColumn = column + j;

        if (neighborRow >= 0 && neighborRow < rowCount &&
            neighborColumn >= 0 && neighborColumn < columnCount) {
          if (_cellMatrix[neighborRow][neighborColumn] == 1) liveNeighborCount++;   
        }
      }
    }

    return liveNeighborCount;
  }

}
