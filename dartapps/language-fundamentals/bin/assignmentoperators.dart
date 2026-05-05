void main() {
  int? a = null;
  print("$a");
  a ??= 0;
  print("$a");

  String? name = null;
  print(name?.toUpperCase());
  name ??= "Subramanian";
  print(name.toUpperCase());
}
