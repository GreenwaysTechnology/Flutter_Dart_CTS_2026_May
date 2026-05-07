class User {
  //instance variable
  int? id;
  String? name;
  int? age;
  String? city;

  //simple constructor
  User(int id, String name, int age, String city) {
    this.id = id;
    this.name = name;
    this.city = city;
    this.age = age;
  }
}

void main() {
  User user = User(1,"Subramanian",46,"Coimbatore");
  print("user id : ${user.id}");
  print("user name : ${user.name}");
  print("user age : ${user.age}");
  print("user city : ${user.city}");
}
