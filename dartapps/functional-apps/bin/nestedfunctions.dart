var counter = () {
  print("Counter outer function");
  //innner function
  inc() {
    print("inner function");
  }

  inc();
};
//returnning inner function
Function like() {
  // return () {
  //   print("function returns");
  // };
  return (int a) => print("function returns $a");
}

void main() {
  counter();
  var res = like();
  res(3);
}
