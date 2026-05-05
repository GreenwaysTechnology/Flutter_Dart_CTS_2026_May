int add(int a, int b) {
  return a + b;
}

dynamic getValue(var value) {
  return value;
}

String? getName(bool flag) {
  if (flag) {
    return "Subramanian";
  }
  return null;
}

//multiple values
(String?, int?) getUser() {
  return ("Subramanian", 30);
}

(dynamic?, dynamic?) getUser1() {
  return (45.56, 30);
}

void main() {
  var res = add(10, 20);
  print("$res");
  print(getValue("string"));
  print(getValue(333));
  print(getValue(true));
  print(getValue(null));
  print(getValue(33.3));
  var (name, age) = getUser();
  print("$name $age");
}
