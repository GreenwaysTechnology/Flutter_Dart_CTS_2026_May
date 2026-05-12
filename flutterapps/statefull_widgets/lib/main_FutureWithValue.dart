Future<String> getValue() {
  return Future.value("Hello, I am async Value");
}

void main() {
  //print(getValue());
  print("Hello");
  getValue().then((value) => print(value));
  print("Hai");
}
