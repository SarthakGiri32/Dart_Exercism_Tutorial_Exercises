class Etl {
  Map<String, int> transform(Map<String, List<String>> scoreToLetterOneToManyMap) {
    Map<String, int> letterToScoreOneToOneMap = <String, int>{};

    scoreToLetterOneToManyMap.forEach((score, letterList) {
      for (final letter in letterList) {
        letterToScoreOneToOneMap[letter.toLowerCase()] = int.parse(score);
      }
    });

    return letterToScoreOneToOneMap;
  }
}
