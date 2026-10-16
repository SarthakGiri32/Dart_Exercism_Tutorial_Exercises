enum BobReplies {
  question('Sure.'),
  yelling('Whoa, chill out!'),
  yellingQuestion('Calm down, I know what I\'m doing!'),
  silence('Fine. Be that way!'),
  anythingElse('Whatever.');

  const BobReplies(this.reply);
  final String reply;

  static final _lettersOnlyRegexMatch = RegExp(r'[A-Za-z]');

  static BobReplies to(String someoneSayingSomething) {
    final text = someoneSayingSomething.trim();
    final isQuestion = text.endsWith('?');
    final isYelling = _lettersOnlyRegexMatch.hasMatch(text) && text == text.toUpperCase();

    return text.isEmpty ? silence : 
                          isYelling ? isQuestion ? yellingQuestion : yelling :
                                      isQuestion? question : anythingElse;
  }
}

class Bob {
  String response(String someoneSayingSomething) => BobReplies.to(someoneSayingSomething).reply;
}
