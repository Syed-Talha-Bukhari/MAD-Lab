Future<String> changeUsername() async{
  try{
    final String userName = await fetchNewUsername();
    return userName;
  }catch(e){
    return e.toString();
  }
}


// The following function is provided to you to simulate
// an asynchronous operation that could take a while and
// potentially throw an exception.

Future<String> fetchNewUsername() =>
    Future.delayed(const Duration(milliseconds: 500), () => throw UserError());
