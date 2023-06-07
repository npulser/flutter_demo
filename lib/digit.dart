import 'digit_match.dart';

class Digit {
  final String value;
  final DigitMatch match;

  Digit(this.value, this.match);

  @override
  String toString() {
    return 'Digit{value: $value, match: $match}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Digit &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          match == other.match;

  @override
  int get hashCode => value.hashCode ^ match.hashCode;
}
