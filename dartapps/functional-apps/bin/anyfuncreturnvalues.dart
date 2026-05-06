var multiply = ({int? a = 0, int? b = 0}) {
  int c = (a ?? 0) * (b ?? 0);
  //print("a=$a b=$b c $c");
  return "a=$a b=$b c=$c";
};

void main() {
  print(multiply(a: 10, b: 20));
}
