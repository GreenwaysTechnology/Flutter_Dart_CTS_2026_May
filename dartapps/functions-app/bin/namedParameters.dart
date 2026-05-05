// void sayName(String? name) {
//   print("$name");
// }

void sayName({String? name = "Your Name"}) {
  print("$name");
}

void login({String? userName = "", String? password = ""}) {
  print("$userName $password");
}

void widget({
  String? name = "Layout",
  int? height = 0,
  int? width = 0,
  String? theme = "light",
}) {
  print("name $name");
  print("height $height");
  print("width $width");
  print("theme $theme");
}

void main() {
  sayName(name: "Subramanian");
  sayName();
  login(userName: "subramanian", password: "1234");
  login(password: "3455", userName: "subramanian");
  login();
  widget(name: "Container", height: 100, width: 200);
  widget(name: "Container", height: 100);
  widget(theme: "light");
  widget(name: "Container");
  widget();
}
