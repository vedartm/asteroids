class Player {
  final Duration duration;
  final int level;
  final double xPosition;
  final double yPosition;

  Player(
    this.duration,
    this.level,
    this.xPosition,
    this.yPosition,
  );

  Player copyWith({
    Duration? duration,
    int? level,
    double? xPosition,
    double? yPosition,
  }) {
    return Player(
      duration ?? this.duration,
      level ?? this.level,
      xPosition ?? this.xPosition,
      yPosition ?? this.yPosition,
    );
  }

  @override
  String toString() {
    return 'Player(duration: $duration, level: $level, xPosition: $xPosition, yPosition: $yPosition)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Player &&
        other.duration == duration &&
        other.level == level &&
        other.xPosition == xPosition &&
        other.yPosition == yPosition;
  }

  @override
  int get hashCode {
    return duration.hashCode ^
        level.hashCode ^
        xPosition.hashCode ^
        yPosition.hashCode;
  }
}
