import './enums.dart';

class GoodFunctions {
  String formatMessage(String oldString) {
    String noSpaces = oldString.replaceAll(' ', '');
    String newString = '';
    int counter = 0;
    for (int i = 0; i < noSpaces.length; i++) {
      if (isLetter(noSpaces[i])) {
        counter++;
        newString += noSpaces[i].toUpperCase();
        if (counter % 5 == 0) newString += ' ';
      }
    }
    return newString;
  }

  int convertToIndex(String character) {
    return character.codeUnitAt(0) - 65;
  }

  String convertToChar(int index) {
    return String.fromCharCode(index + 65);
  }

  String encodeChar({
    required int initialIndex,
    required int shift,
    required Direction direction,
  }) {
    int newIndex = direction == Direction.Forward
        ? initialIndex + shift
        : initialIndex - shift;
    newIndex %= 26;
    return convertToChar(newIndex);
  }

  bool isLetter(String character) {
    return character.startsWith(RegExp(r'[a-z]', caseSensitive: false));
  }
}
