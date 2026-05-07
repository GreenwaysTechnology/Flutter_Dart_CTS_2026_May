class MyNumber<T extends num> {
  T data;

  MyNumber(this.data);

  num add<T extends num>(T value1, T value2) {
    return value1 + value2;
  }
}

void main() {
  MyNumber myNumber = MyNumber(10);
  var res = myNumber.add<int>(12, 20);
  print("res ${res}");
}
