class AtbashCipher {
  List<String> get punctuation => ['.', ',', ';', '?', '!', '-'];
  Map<String, String> get cipherKeysMap => const {
    'a': 'z',
    'b': 'y',
    'c': 'x',
    'd': 'w',
    'e': 'v',
    'f': 'u',
    'g': 't',
    'h': 's',
    'i': 'r',
    'j': 'q',
    'k': 'p',
    'l': 'o',
    'm': 'n',
    'n': 'm',
    'o': 'l',
    'p': 'k',
    'q': 'j',
    'r': 'i',
    's': 'h',
    't': 'g',
    'u': 'f',
    'v': 'e',
    'w': 'd',
    'x': 'c',
    'y': 'b',
    'z': 'a'
  };

  String encode(String plainText) {
    plainText = plainText.toLowerCase();
    List<String> plainTextSimplified = <String>[];
    int k = 0; StringBuffer singleToken = StringBuffer();
    for (int i = 0; i < plainText.length; i++) {      
      if (k == 5) {
        plainTextSimplified.add(singleToken.toString());
        singleToken.clear();
        k = 0;
      }
      if (!(punctuation.contains(plainText[i]) || plainText[i] == ' ')) {
        writeToBuffer(singleToken, plainText[i]);
        k++;
      }
    }
    if (k > 0 && (singleToken.isNotEmpty || plainTextSimplified.isEmpty)) {
      plainTextSimplified.add(singleToken.toString());
    }
    return plainTextSimplified.join(' ');
  }

  String decode(String cipherText) {
    StringBuffer plainText = StringBuffer();
    for (int i = 0; i < cipherText.length; i++) {  
      if (cipherText[i] != ' ') {
        writeToBuffer(plainText, cipherText[i]);
      }
    }
    return plainText.toString();
  }

  void writeToBuffer(StringBuffer stringBuffer, String singleCharacter) {
    RegExp singleDigitRegex = RegExp(r'\d');
    if (singleDigitRegex.hasMatch(singleCharacter)) {
      stringBuffer.write(singleCharacter);
    }
    else {
      stringBuffer.write(cipherKeysMap[singleCharacter]);
    }
  }
}
