class User {
  //_ notation is used to make the variable private
  String? _firstName;
  String? lastName;

  set firstName(String firstName) {
    //using this keyword
    //this._firstName = firstName;
    //without using this keyword is also valid
    _firstName = firstName;
  }

  // get firstName {
  //     return _firstName;
  // }
  String get firstName => "${_firstName?.toUpperCase()}";
}

void main() {
  User user = User();
  user.firstName = "Subramaian"; //setter

  print("First Name ${user.firstName}");
}
