class Particle {
  final int size;
  final int xVelocity;
  final int yVelocity;
  final double xPosition;
  final double yPosition;

  Particle(
    this.size,
    this.xVelocity,
    this.yVelocity,
    this.xPosition,
    this.yPosition,
  );

  Particle copyWith({
    int? size,
    int? xVelocity,
    int? yVelocity,
    double? xPosition,
    double? yPosition,
  }) {
    return Particle(
      size ?? this.size,
      xVelocity ?? this.xVelocity,
      yVelocity ?? this.yVelocity,
      xPosition ?? this.xPosition,
      yPosition ?? this.yPosition,
    );
  }

  @override
  String toString() {
    return 'Particle(size: $size, xVelocity: $xVelocity, yVelocity: $yVelocity, xPosition: $xPosition, yPosition: $yPosition)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Particle &&
        other.size == size &&
        other.xVelocity == xVelocity &&
        other.yVelocity == yVelocity &&
        other.xPosition == xPosition &&
        other.yPosition == yPosition;
  }

  @override
  int get hashCode {
    return size.hashCode ^
        xVelocity.hashCode ^
        yVelocity.hashCode ^
        xPosition.hashCode ^
        yPosition.hashCode;
  }
}
