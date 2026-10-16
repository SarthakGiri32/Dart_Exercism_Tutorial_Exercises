class WordCount {
  static const _validSeparatorList = ':!?\t\n ",.&@\$%^';
  // removes recommended punctuations
  static final _subtitleWordSplitter = RegExp('[${RegExp.escape(_validSeparatorList)}]+');
  // removes preceding and trailing single/double quotes
  static final _wordEdgeQuotes = RegExp(r"^'+|'+$");

  // Simple solution
  /* Map<String, int> countWords(String subtitle) {
    final subtitleWordCountMap = <String, int>{};
    
    subtitle.toLowerCase()
            .split(_subtitleWordSplitter)
            .forEach((w) {
              final word = w.replaceAll(_wordEdgeQuotes, '');
              if (word.isNotEmpty) subtitleWordCountMap.update(word, 
                                                              (count) => count + 1,
                                                              ifAbsent: () => 1);
            });
    
    return subtitleWordCountMap;
  } */
  
  // Functional solution
  Map<String, int> countWords(String subtitle) => subtitle.toLowerCase()
                                                          .split(_subtitleWordSplitter)
                                                          .map((w) => w.replaceAll(_wordEdgeQuotes, ''))
                                                          .where((w) => w.isNotEmpty)
                                                          .fold(<String, int>{}, (subtitleWordCountMap, w) =>
                                                            subtitleWordCountMap..update(w, 
                                                                                        (count) => count + 1,
                                                                                        ifAbsent: () => 1
                                                          ));
}
