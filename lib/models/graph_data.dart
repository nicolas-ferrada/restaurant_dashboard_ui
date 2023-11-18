class GraphData {
  final double y;

  const GraphData(this.y);

  bool isValid() {
    return y >= 0 && y <= 6;
  }
}
