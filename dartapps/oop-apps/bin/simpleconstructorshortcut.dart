class User {
  //instance variable
  int? id;
  String? name;
  int? age;
  String? city;
  //simple constructor
  User(this.id, this.name, this.age, this.city) {}
}

void main() {
  User user = User(1, "Subramanian", 46, "Coimbatore");
  print("user id : ${user.id}");
  print("user name : ${user.name}");
  print("user age : ${user.age}");
  print("user city : ${user.city}");
}
