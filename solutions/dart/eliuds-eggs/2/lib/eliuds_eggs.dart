class EggCounter {
  int count(int encodedEggCountInDecimal) {
    int eggCount = 0;

    do {
      eggCount += encodedEggCountInDecimal % 2;
      encodedEggCountInDecimal ~/= 2;
    } while (encodedEggCountInDecimal > 0);

    return eggCount;
  }
}
