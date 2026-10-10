class GameOfLife {
  List<List<int>> _cellMatrix;

  // Safely deep-copy the initial cell matrix upon instantiation
  GameOfLife(List<List<int>> initialCellMatrix)
    : _cellMatrix = initialCellMatrix.map((row) => List<int>.from(row)).toList();

  // Expose cell matrix as a deep copy to prevent external mutation
  List<List<int>> get cellMatrix => _cellMatrix.map((row) => List<int>.from(row)).toList();

  /// Returns the current state of the cell matrix as a deep copy.
  List<List<int>> matrix() {
    return _cellMatrix.map((row) => List<int>.from(row)).toList();
  }

  int get rowCount => _cellMatrix.length;
  int get columnCount => _cellMatrix.isNotEmpty ? _cellMatrix[0].length : 0;

  /// advances the cell lives to the next generation
  void tick() {
    _cellMatrix = List.generate(rowCount, (r) {
      return List.generate(columnCount, (c) {
        int liveNeighborCount = _getLiveNeighborCount(r, c);
        int currentCellStatus = _cellMatrix[r][c];

        if (currentCellStatus == 1) {
          return (liveNeighborCount == 2 || liveNeighborCount == 3) ? 1 : 0;
        } else {
          return (liveNeighborCount == 3) ? 1 : 0;
        }
      });
    });
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
