void main() {
  List<int> arr = [1, 2, 3, 4];
  Set<String> set = {'white', 'black', 'red'};


  Map<int, String> swapKeysValues(Map<String, int> originalMap) {
    return originalMap.map((key, value) => MapEntry(value, key));
  }


  Map<String, int> map = {};
  set.forEach((key) {
    if (arr.isNotEmpty) {
      map[key] = arr.removeAt(0);
    }
  });
  print('Map unswapped: $map');

  Map<int, String> swappedMap = swapKeysValues(map);

  print('Map swapped: $swappedMap');
}

