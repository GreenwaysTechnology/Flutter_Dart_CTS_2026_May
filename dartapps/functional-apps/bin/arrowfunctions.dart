//if function has single line of expression
var greet = () {
  print("Hello");
};
//arrrow version
// var tmpGreet = () => {print("Hello")};

var tmpGreet = () => print("Hello");
var add = (int a, int b) => a + b;
var multply = ({int? a = 0, int? b = 0}) => (a ?? 0) * (b ?? 0);

void main() {
  greet();
  tmpGreet();
  print(add(10, 20));
  print(multply(a: 10, b: 20));
  print(multply(a: 0, b: 20));
}
