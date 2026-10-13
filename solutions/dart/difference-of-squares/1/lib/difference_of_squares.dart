class DifferenceOfSquares {
  int squareOfSum(int n) {
    int total = (n * (n + 1)) ~/ 2;
    return total * total;
  }

  int sumOfSquares(int n) {
    return (n * (n + 1) * ((n * 2) + 1)) ~/ 6;
  }
  
  int differenceOfSquares(int n) {
    return squareOfSum(n) - sumOfSquares(n);
  }
}
