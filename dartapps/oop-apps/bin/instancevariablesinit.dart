class User {
  //instance variables
  int? id = 1;
  String? name = "Subramanian";
  int? age = 46;
  String? city = "Coimbatore";
}

void main() {
  User user = new User();

  print("user id : ${user.id}");
  print("user name : ${user.name}");
  print("user age : ${user.age}");
  print("user city : ${user.city}");

  user.id = 1;
  user.name = "John";
  user.age = 25;
  user.city = "New York";

  print("user id : ${user.id}");
  print("user name : ${user.name}");
  print("user age : ${user.age}");
  print("user city : ${user.city}");
}
