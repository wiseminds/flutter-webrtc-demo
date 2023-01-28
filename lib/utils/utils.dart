library random_string;

import 'dart:math';

class Utils {
  static const asciiStart = 33;
  static const asciiEnd = 126;
  static const numericStart = 48;
  static const numericEnd = 57;
  static const lowerAlphaStart = 97;
  static const lowerAlphaEnd = 122;
  static const upperAlphaStart = 65;
  static const upperAlphaEnd = 90;

  /// Generates a random integer where [from] <= [to].
  static int randomBetween(int from, int to) {
    if (from > to) throw Exception('$from cannot be > $to');
    var rand = Random();
    return ((to - from) * rand.nextDouble()).toInt() + from;
  }

  /// Generates a random string of [length] with characters
  /// between ascii [from] to [to].
  /// Defaults to characters of ascii '!' to '~'.
  static String randomString(int length, {int from: asciiStart, int to: asciiEnd}) {
    return String.fromCharCodes(
        List.generate(length, (index) => randomBetween(from, to)));
  }

  /// Generates a random string of [length] with only numeric characters.
  static String randomNumeric(int length) =>
      randomString(length, from: numericStart, to: numericEnd);
}
