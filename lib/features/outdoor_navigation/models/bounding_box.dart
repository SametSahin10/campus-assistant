class BoundingBox {
  final double x, y, width, height;
  final List<double> confidenceScores;

  const BoundingBox({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.confidenceScores,
  });
}
