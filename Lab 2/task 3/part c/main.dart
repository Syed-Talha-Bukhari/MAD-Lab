class Point {
  final int _x;
  final int _y;
  const Point(this._x, this._y);
  const Point.origin() : _x = 0, _y = 0;
  int get x => _x;
  int get y => _y;
}

class Size {
  final int _w;
  final int _h;

  const Size(this._w, this._h);

  const Size.zero() : _w = 0, _h = 0;

  int get w => _w;

  int get h => _h;
}

class Frame {
  Point _position;
  Size _size;

  Frame(Point position, Size size)
      : _position = position,
        _size = size;

  Frame.withOrigin(Point origin) : this(origin, Size.zero());

  Frame.fromPositionAndDimensions(Point position, int w, int h)
      : this(position, Size(w, h));

  Point get position => _position;
  set position(Point value) => _position = value;

  Size get size => _size;
  set size(Size value) => _size = value;

  int get x => _position.x;
  int get y => _position.y;
  int get w => _size.w;
  int get h => _size.h;

  factory Frame.withNonNegativeSize(Point position, Size size) {
    if (size.w < 0 || size.h < 0) {
      throw ArgumentError('Width and Height must be non-negative');
    }
    return Frame(position, size);
  }
}

void main() {
  try {
    var origin = Point.origin();
    var size0 = Size.zero();
    var frame1 = Frame.withOrigin(origin)..size = size0;
    print('Frame 1: Position=(${frame1.x}, ${frame1.y}), Size=(${frame1.w}, ${frame1.h})');

    var position = Point(1, 2);
    var size = Size(3, 4);
    var frame2 = Frame.withNonNegativeSize(position, size);
    print('Frame 2: Position=(${frame2.x}, ${frame2.y}), Size=(${frame2.w}, ${frame2.h})');
  } catch (err) {
    print('Error: $err');
  }
}
