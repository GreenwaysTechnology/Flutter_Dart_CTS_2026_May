void sayHello() {
  print("Hello");
}

void main() {
  // sayHello();
  var hello = sayHello;
  Function tempHello = sayHello;
  //
  hello();
  tempHello();

  hello.call();
  tempHello.call();
}


