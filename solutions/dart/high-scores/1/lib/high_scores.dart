class HighScores {
  List<int> _scores = <int>[];

  HighScores(List<int> initialScores)
    :_scores = [...initialScores];

  List<int> get scores => [..._scores];

  int latest() {
    return _scores.last;
  }

  int personalBest() {
    int maxScore = 0;
    _scores.forEach((score) => maxScore = (maxScore < score) ? score : maxScore);
    return maxScore;
  }

  List<int> personalTopThree() {
    List<int> scoresLocalCopy = [..._scores];
    scoresLocalCopy.sort((score1, score2) => score2.compareTo(score1));
    scoresLocalCopy = (scoresLocalCopy.length >= 3) ? scoresLocalCopy.sublist(0, 3) : scoresLocalCopy;
    return scoresLocalCopy;
  }

}
