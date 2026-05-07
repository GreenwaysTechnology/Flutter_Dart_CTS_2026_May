class User {
  //instance variable
  int? id;
  String? name;
  int? age;
  String? city;
  //simple constructor
  User({this.id=1, this.name="Your Name", this.age=18, this.city="Your City"}) {}
}

void main() {
  User user = User(id:1,name:"Subramanian",age:46,city:"Coimbatore");
  print("user id : ${user.id}");
  print("user name : ${user.name}");
  print("user age : ${user.age}");
  print("user city : ${user.city}");

  user = User();
  print("user id : ${user.id}");
  print("user name : ${user.name}");
  print("user age : ${user.age}");
  print("user city : ${user.city}");
}
