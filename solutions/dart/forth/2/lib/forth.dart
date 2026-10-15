class Forth {
  final List<int> _stack = [];
  final Map<String, List<String>> _words = {};

  List<int> get stack => _stack;

  void evaluate(String input) {
    final tokens = input
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .where((t) => t.isNotEmpty)
        .toList();

    var i = 0;
    while (i < tokens.length) {
      final token = tokens[i];

      if (token == ':') {
        final end = tokens.indexOf(';', i + 1);
        if (end == -1 || end - i < 3) {
          throw Exception('Invalid definition');
        }
        final name = tokens[i + 1];
        if (int.tryParse(name) != null) {
          throw Exception('Invalid definition');
        }
        // Expand the body at definition time so later redefinitions
        // of the words it uses don't affect it.
        final body = <String>[];
        for (final t in tokens.sublist(i + 2, end)) {
          body.addAll(_words[t] ?? [t]);
        }
        _words[name] = body;
        i = end + 1;
        continue;
      }

      if (_words.containsKey(token)) {
        for (final t in _words[token]!) {
          _execute(t);
        }
      } else {
        _execute(token);
      }
      i++;
    }
  }

  void _execute(String token) {
    final number = int.tryParse(token);
    if (number != null) {
      _stack.add(number);
      return;
    }

    switch (token) {
      case '+':
        _binary((a, b) => a + b);
      case '-':
        _binary((a, b) => a - b);
      case '*':
        _binary((a, b) => a * b);
      case '/':
        _binary((a, b) {
          if (b == 0) throw Exception('Division by zero');
          return a ~/ b;
        });
      case 'dup':
        _need(1);
        _stack.add(_stack.last);
      case 'drop':
        _need(1);
        _stack.removeLast();
      case 'swap':
        _need(2);
        final b = _stack.removeLast();
        final a = _stack.removeLast();
        _stack..add(b)..add(a);
      case 'over':
        _need(2);
        _stack.add(_stack[_stack.length - 2]);
      default:
        throw Exception('Unknown command');
    }
  }

  void _need(int n) {
    if (_stack.length < n) throw Exception('Stack empty');
  }

  void _binary(int Function(int a, int b) op) {
    _need(2);
    final b = _stack.removeLast();
    final a = _stack.removeLast();
    _stack.add(op(a, b));
  }
}