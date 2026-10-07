import 'dart:collection';

int score(String word) {
  final scrabbleMap = {
    1: ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
    2: ['D', 'G'],
    3: ['B', 'C', 'M', 'P'],
    4: ['F', 'H', 'V', 'W', 'Y'],
    5: ['K'],
    8: ['J', 'X'],
    10: ['Q', 'Z']
  };
  HashMap<int, List<String>> scrabbleHashMap = HashMap()..addEntries(scrabbleMap.entries);
  
  int scrabbleScore = 0;
  scrabbleHashMap.forEach((score, letterList) {
    for (int i = 0; i < word.length; i++) {
      if (letterList.contains(word[i].toUpperCase())) scrabbleScore += score;
    }
  });

  return scrabbleScore;
}
