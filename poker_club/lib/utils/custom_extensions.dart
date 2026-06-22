// titlecase string extension
extension StringExtension on String {
  String toTitleCase({bool onlyFirstWord = false}) {
    if (length <= 1) {
      return toUpperCase();
    }

    // Split string into multiple words
    final List<String> words = split(' ');

    // If onlyFirstWord is true, capitalize only the first word and return
    if (onlyFirstWord) {
      final String firstWord = words.first.trim();
      if (firstWord.isNotEmpty) {
        final String firstLetter = firstWord.substring(0, 1).toUpperCase();
        final String remainingLetters = firstWord.substring(1);
        return '$firstLetter$remainingLetters';
      }
      return '';
    }

    // Capitalize first letter of each word
    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);
        return '$firstLetter$remainingLetters';
      }
      return '';
    });

    // Join all words back to a single string
    return capitalizedWords.join(' ');
  }
}
