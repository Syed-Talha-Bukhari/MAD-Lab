void main() {
  List<int> arr = [1, 2, 3, 4];
  Set<String> set = {'white', 'black', 'red'};

  if (arr.length < set.length) {
    int diff = set.length - arr.length;
    for (int i = 0; i < diff; i++) {
      arr.add(0);
    }
    print('Case 1: Array length < set length');
  } else if (arr.length > set.length) {
    int diff = arr.length - set.length;
    for (int i = 0; i < diff; i++) {
      arr.removeLast();
    }
    print('Case 2: Array length > set length.');
  } else {
    print('Array length  set length');
  }

  print('\nFinal array: $arr');
}
