class Size {
  int _w;
  int _h;

  Size.Zero() : _w = 0, _h = 0;

  Size([int w = 0, int h = 0]) : _w = w, _h = h;

  int get w => _w;
  set w(int value) => _w = value;

  int get h => _h;
  set h(int value) => _h = value;

  Size.fromWidth(int w) : _w = w, _h = 0;

  Size.fromHeight(int h) : _w = 0, _h = h;

  factory Size.withNonNegativeValues(int w, int h) {
    if (w < 0 || h < 0) {
      throw ArgumentError('Width and Height must be non-negative');
    }
    return Size(w, h);
  }

}

void main() {
  try {
    var size0 = Size.Zero();
    print('Size 0: Width=${size0.w}, Height=${size0.h}');

    var size1 = Size()..w = 1..h = 2;
    print('Size 1: Width=${size1.w}, Height=${size1.h}');

    var size2 = Size.withNonNegativeValues(1, -1);
    print('Size 2: Width=${size2.w}, Height=${size2.h}');

  } catch (err) {
    print('Error: $err');
  }
}
