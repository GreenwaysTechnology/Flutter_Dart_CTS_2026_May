void add(int a, int b) {
  int c = a + b;
  print("C $c");
}

//here even though var keyword , we cant pass other than int , the reason is
//the variables used inside function is subsuited against int
//int c = a + b
//if you want to accept any tye
//var c = a + b
void calculate(var a, var b) {
  var c = a + b;
  print("C $c");
}
// void input(var myvar){
//    print("Myvar is $myvar");
// }
void input(dynamic myvar){
  print("Myvar is $myvar");
}

void main() {
  add(10, 30);
  calculate("10", "10");
  calculate(10, 10);
  calculate(10.7, 2.6);
  //NoSuchMethodError: Class 'bool' has no instance method '+'.
  // Receiver: true
  //calculate(true, false);
  input("string");
  input(10);
  input(34.5);
  input(false);
}
