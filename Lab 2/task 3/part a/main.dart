class Point {
  final int _x;
  final int _y;

  Point.Origin() : _x = 0, _y = 0;

  Point([int x = 0, int y = 0]) : _x = x, _y = y;

  int get x => _x;

  int get y => _y;

  Point.fromCoordinates(int x, int y) : _x = x, _y = y;
}

void main() {
  var origin = Point.Origin();
  print('Origin: (${origin.x}, ${origin.y})');

  var point1 = Point();
  print('Point 1: (${point1.x}, ${point1.y})');

  var point2 = Point(2, 3);
  print('Point 2: (${point2.x}, ${point2.y})');

  var point3 = Point.fromCoordinates(-2, 2);
  print('Point 3: (${point3.x}, ${point3.y})');
}
