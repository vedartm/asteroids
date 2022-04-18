extension DurationX on Duration {
  String format() {
    if (inHours == 0) return toString().substring(2, 7);
    return toString().substring(2, 7);
  }

  String descriptive() {
    if (inMinutes == 0) return _getSingularOrPlural('second', inSeconds);
    if (inHours == 0) {
      return '${_getSingularOrPlural('minute', inMinutes)} and ${_getSingularOrPlural('second', inSeconds)}';
    }
    return '${_getSingularOrPlural('hour', inHours)} ${_getSingularOrPlural('minute', inMinutes)} and ${_getSingularOrPlural('second', inSeconds)}';
  }

  String _getSingularOrPlural(String word, int count) =>
      count > 1 ? '$count ${word}s' : '$count $word';
}
