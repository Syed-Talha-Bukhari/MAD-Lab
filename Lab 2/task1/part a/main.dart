import 'dart:io';

void main() {
  print('Please enter your name:');
  String? userName = stdin.readLineSync();

  if (userName == null || userName.isEmpty) {
    userName = 'Guest';
  }

  print('Hello $userName, welcome to Flutter!');
}
