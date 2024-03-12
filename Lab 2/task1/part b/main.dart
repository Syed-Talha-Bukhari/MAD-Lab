import 'dart:io';

void greetUser([String? userName]) {
  if (userName == null || userName.isEmpty) {
    userName = 'Guest';
  }
  print('Hello $userName, welcome to Flutter!');
}

void main() {
  print('Please enter your name:');
  String? userName = stdin.readLineSync();
  greetUser(userName);
}
