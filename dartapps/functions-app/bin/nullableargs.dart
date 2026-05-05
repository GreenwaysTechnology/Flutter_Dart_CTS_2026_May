void sayHello(String? name) {
  var res = name ?? "Your Name";
  print("$res");
}
void sayHai(var name){
  print("Hai ${name ?? "Guest"}");

}

void main() {
  sayHello("Subramanian");
  sayHello(null);
  sayHai(null);
}
