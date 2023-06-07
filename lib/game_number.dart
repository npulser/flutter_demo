class GameNumber {
  static final allowedCharacters = '0123456789ABCDEF'.split('');
  final String value;

  GameNumber(this.value) {
    if (value.length < 4) {
      throw ArgumentError("less than 4 digits");
    }

    if (value.length > 4) {
      throw ArgumentError("more than 4 digits");
    }

    final digits = value.split('');
    if (!digits.every(allowedCharacters.contains)) {
      throw ArgumentError("has invalid character");
    }
  }

  factory GameNumber.zero() => GameNumber([
    allowedCharacters[0],
    allowedCharacters[0],
    allowedCharacters[0],
    allowedCharacters[0]
  ].join(''));

  List<String> get digits => value.split('');
}
