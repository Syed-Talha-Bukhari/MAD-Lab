// Part 1
// Call the provided async function fetchRole()
// to return the user role.
Future<String> reportUserRole() async {
    try{
      final String role = await fetchRole();
      return 'User role: $role';
    }catch(e){
      return 'Error: $e';
    }
}

// Part 2
// Call the provided async function fetchLoginAmount()
// to return the number of times that the user has logged in.
Future<String> reportLogins() async {
  try{
    final int loginAmount = await fetchLoginAmount();
    return 'Total number of logins: $loginAmount';
  }catch(e){
    return 'Error: $e';
  }
}

// The following functions those provided to you to simulate
// asynchronous operations that could take a while.

Future<String> fetchRole() => Future.delayed(_halfSecond, () => _role);
Future<int> fetchLoginAmount() => Future.delayed(_halfSecond, () => _logins);
