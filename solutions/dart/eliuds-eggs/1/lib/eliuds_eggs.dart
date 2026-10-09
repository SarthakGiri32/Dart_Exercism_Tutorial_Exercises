class EggCounter {
  int count(int encodedEggCountInDecimal) {
    int eggCount = 0;

    do {
      if (encodedEggCountInDecimal % 2 == 1) {
        eggCount += 1;
      }
      encodedEggCountInDecimal = encodedEggCountInDecimal ~/ 2;
    } while (encodedEggCountInDecimal > 0);

    return eggCount;
  }
}
