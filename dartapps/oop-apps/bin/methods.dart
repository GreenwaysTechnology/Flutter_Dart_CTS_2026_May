class UserService {
  //instance methods
  String findAll() {
    return "findAll";
  }
  String fetchDetails() => "fetchDetails";

  String save(String? name) => "$name";
}

void main() {
  var user = UserService();
  print(user.findAll());
  print(user.fetchDetails());
  print(user.save("Subramanian"));
}
