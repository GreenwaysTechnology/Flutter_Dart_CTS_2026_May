class User {
  //instance variables
  String? firstName = "Subramanian";
  String? lastName = "Murugan";

  //getters
  String get fullName => "$firstName $lastName";
}

void main() {
  User user = User();
  print(user.fullName);
}
