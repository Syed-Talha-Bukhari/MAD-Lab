// Part 1
String addHello(String user) => 'Hello $user';

// Part 2
// Call the provided async function fetchUsername()
// to return the username.
Future<String> greetUser() async {
  final username = await fetchUsername();
  return addHello(username);
}

// Part 3
// Call the provided async function logoutUser()
// to log out the user.
Future<String> sayGoodbye() async {
  try {
    final result = await logoutUser();
    return '$result Thanks, see you next time';
  } catch (e) {
    return 'Failed to logout user: $e';
  }
}


// The following functions are provided to you to use in your solutions.

Future<String> fetchUsername() => Future.delayed(_halfSecond, () => 'Jean');

Future<String> logoutUser() => Future.delayed(_halfSecond, _failOnce);
