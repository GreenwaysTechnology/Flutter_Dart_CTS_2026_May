import "package:my_app/User.dart";

class Userrepository {

  List<User> getUsers() {
    return [
      User(name: "John", city: "New York"),
      User(name: "Jane", city: "London"),
      User(name: "Bob", city: "Paris"),
      User(name: "Alice", city: "Tokyo"),
    ];
  }
}