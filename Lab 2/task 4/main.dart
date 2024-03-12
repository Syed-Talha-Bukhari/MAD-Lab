import 'dart:math';

class Matrix {
  late List<List<int>> _data;
  late int _rows;
  late int cols;

  Matrix(List<List<int>> data)
      : _data = List.from(data),
        _rows = data.length,
        cols = data.isNotEmpty ? data[0].length : 0 {
    if (!_data.every((row) => row.length == cols)) {
      throw ArgumentError('Rows and columns must be equal in number');
    }
  }

  int get rows => _rows;

  int get columns => cols;

  factory Matrix.generate({required int rows, required int columns}) {
    if (rows <= 0 || columns <= 0) {
      throw ArgumentError('There must be a row and column');
    }
    var random = Random();
    var data = List.generate(rows, (i) => List.generate(columns, (j) => random.nextInt(10)));
    return Matrix(data);
  }

  Matrix add(Matrix otherMatrix) {
    if (_rows != otherMatrix.rows || cols != otherMatrix.columns) {
      throw ArgumentError('Matrix should have same dimensions');
    }
    var resultData = List.generate(_rows, (i) => List.generate(cols, (j) => _data[i][j] + otherMatrix._data[i][j]));
    return Matrix(resultData);
  }

  Matrix subtract(Matrix otherMatrix) {
    if (_rows != otherMatrix.rows || cols != otherMatrix.columns) {
      throw ArgumentError('Matrix should have same dimensions');
    }
    var resultData = List.generate(_rows, (i) => List.generate(cols, (j) => _data[i][j] - otherMatrix._data[i][j]));
    return Matrix(resultData);
  }

  Matrix multiply(Matrix otherMatrix) {
    if (cols != otherMatrix.rows) {
      throw ArgumentError('Number of columns in first matrix must be = number of rows in second matrix for multiplication');
    }
    var resultData = List.generate(_rows, (i) => List.generate(otherMatrix.columns, (j) {
      var sum = 0;
      for (var k = 0; k < cols; k++) {
        sum += _data[i][k] * otherMatrix._data[k][j];
      }
      return sum;
    }));
    return Matrix(resultData);
  }

  Matrix transpose() {
    var resultData = List.generate(cols, (i) => List.generate(_rows, (j) => _data[j][i]));
    return Matrix(resultData);
  }

  void printMatrix() {
    for (var row in _data) {
      print(row);
    }
  }
}

void main() {
  try {
    var matrix1 = Matrix.generate(rows: 2, columns: 2);
    var matrix2 = Matrix.generate(rows: 2, columns: 2);

    print('Matrix 1:');
    matrix1.printMatrix();
    print('');

    print('Matrix 2:');
    matrix2.printMatrix();
    print('');

    var matrixAddition = matrix1.add(matrix2);
    print('Addition:');
    matrixAddition.printMatrix();


    var matrixSubtraction = matrix1.subtract(matrix2);
    print('Subtraction:');
    matrixSubtraction.printMatrix();


    var matrixMultiplication = matrix1.multiply(matrix2);
    print('Multiplication:');
    matrixMultiplication.printMatrix();


    var matrixTranspose = matrix1.transpose();
    print('Transpose:');
    matrixTranspose.printMatrix();
  } catch (err) {
    print('Error: $err');
  }
}
