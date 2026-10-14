class Proverb {
  List<String> _proverbTemplate = ['And all for the want of a replace1.',
                                  'For want of a replace1 the replace2 was lost.'];
  
  String recite(List<String> pieces) {
    StringBuffer recitedProverb = StringBuffer('');
    if (pieces.isEmpty) return '';
    else if (pieces.length > 1) {
      for (int i = 0; i < pieces.length - 1; i++) {
        recitedProverb.writeln(_proverbTemplate[1].replaceAll('replace1', pieces[i])
                                                  .replaceAll('replace2', pieces[i + 1]));
      }
    }
    recitedProverb.write(_proverbTemplate[0].replaceAll('replace1', pieces[0]));
    return recitedProverb.toString();
  }
}
