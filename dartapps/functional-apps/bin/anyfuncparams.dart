// Args ,parameters in anonyous functions :Positional and Named
//positional
var add = (int a, int b) {
  int c = a + b;
  print("c $c");
};
//Named parameters with default values
var multiply = ({int? a = 0, int? b = 0}) {
  int c = (a ?? 0) * (b ?? 0);
  print("a=$a b=$b c $c");
};
void main() {
  add(10, 10);
  multiply();
  multiply(a: 10, b: 20);
  multiply(a: 10, b: null);
}

