// Implement a custom InvalidNucleotideException exception
class InvalidNucleotideException implements Exception {
  final String message;
  const InvalidNucleotideException([this.message = 'Invalid Nucleotide Sequence Detected']);

  @override
  String toString() => 'InvalidNucleotideException: $message';
}

class NucleotideCount {
  Map<String, int> count(String strand) {
    final Map<String, int> nucleotideMap = {'A': 0, 'C': 0, 'G': 0, 'T': 0};
    strand.split('').forEach((nucleotide) {
      if (!nucleotideMap.containsKey(nucleotide)) throw InvalidNucleotideException();
      nucleotideMap[nucleotide] = nucleotideMap.update(nucleotide, (count) => count + 1);
    });

    return nucleotideMap;
  }
}
