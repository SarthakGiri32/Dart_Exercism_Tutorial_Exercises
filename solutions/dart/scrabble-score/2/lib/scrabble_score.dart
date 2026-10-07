int score(String word) {
  final scrabbleMap = const {
    1: ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
    2: ['D', 'G'],
    3: ['B', 'C', 'M', 'P'],
    4: ['F', 'H', 'V', 'W', 'Y'],
    5: ['K'],
    8: ['J', 'X'],
    10: ['Q', 'Z']
  };
  
  int scrabbleScore = 0;
  scrabbleMap.forEach((score, letterList) {
    for (int i = 0; i < word.length; i++) {
      if (letterList.contains(word[i].toUpperCase())) scrabbleScore += score;
    }
  });

  return scrabbleScore;
}
