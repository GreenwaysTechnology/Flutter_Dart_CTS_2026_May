class User {
  //instance variable
  int? id;
  String? name;
  int? age;
  String? city;

  //multiple named constructor
  User({
    this.id = 1,
    this.name = "Your Name",
    this.age = 18,
    this.city = "Your City",
  }) {}

  //Create object from Json data: used in api responses, localstorage data, firebase documents
  User.fromJson({
    this.id = 0,
    this.name = "Your Name",
    this.age = 18,
    this.city = "Your City",
  }) {}

  //named constructors
  User.createUser() : id = 1, name = "Ram", age = 18, city = "Chennai";
  User.createAdmin() : id = 2, name = "Admin", age = 18, city = "Chennai";
}

void main() {
  User user = User(id: 1, name: "Subramanian", age: 46, city: "Coimbatore");
  print("user id : ${user.id}");
  print("user name : ${user.name}");
  print("user age : ${user.age}");
  print("user city : ${user.city}");

  user = User();
  print("user id : ${user.id}");
  print("user name : ${user.name}");
  print("user age : ${user.age}");
  print("user city : ${user.city}");

  user = User(id: 1, name: "Murugan");
  print("user id : ${user.id}");
  print("user name : ${user.name}");
  print("user age : ${user.age}");
  print("user city : ${user.city}");

  user = User.fromJson(id: 1, name: 'Subramanian', age: 46, city: 'Coimbatore');
  print("user id : ${user.id}");
  print("user name : ${user.name}");
  print("user age : ${user.age}");
  print("user city : ${user.city}");

  user = User.createUser();
  print("user id : ${user.id}");
  print("user name : ${user.name}");
  print("user age : ${user.age}");
  print("user city : ${user.city}");
}
