Future<String> getValue() {
  return Future.value("Hello, I am async Value");
}

void main() async {
  var value = await getValue();
  print(value);
}
