class ArmstrongNumbers {
  bool isArmstrongNumber(String numInStringForm) {
    var number = BigInt.parse(numInStringForm);
    int numberOfDigits = numInStringForm.length;
    var isArmstrongSum = BigInt.from(0);
    for (int i = 0; i < numberOfDigits; i++) {
      isArmstrongSum += BigInt.parse(numInStringForm[i]).pow(numberOfDigits);
    }
    return isArmstrongSum == number;
  }
}
