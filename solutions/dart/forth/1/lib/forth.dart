class Forth {
  List<int> _stack = [];
  List<String> _arithmeticSymbols = ['+', '-', '*', '/'];

  List<int> get stack => [..._stack];

  void evaluate(String possibleStackContent) {
    var possibleStack = possibleStackContent.split(' ');
    if (possibleStack.length == 1 ||
        (possibleStack.length == 2 && _arithmeticSymbols.contains(possibleStack[1]))) {
      throw Exception('Stack empty');
    }
    int k = 0;
    for (int i = 0; i < possibleStack.length; i++) {
      int opResult = 0;
      if (_arithmeticSymbols.contains(possibleStack[i])) {
        int firstOperand = _stack[k - 2];
        int secondOperand = _stack[k - 1];
        String operator = possibleStack[i];
        switch (operator) {
          case '+': opResult = firstOperand + secondOperand;
            break;
          case '-': opResult = firstOperand - secondOperand;
            break;
          case '*': opResult = firstOperand * secondOperand;
            break;
          case '/':
            if (secondOperand == 0) throw Exception('Division by zero');
            opResult = firstOperand ~/ secondOperand;
        };
        _stack.removeRange(k - 2, k);
        _stack.insert(k - 2, opResult);
        k = _stack.length;
      } else {
        _stack.add(int.parse(possibleStack[i]));
        k++;
      }
    }
  }
}
