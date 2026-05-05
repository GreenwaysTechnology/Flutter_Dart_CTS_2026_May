void main() {
  var name = "Subramnaian"; // infered as string
  name = "dart"; // no compile time error
  //name =100; // compile time error, because once the variable is initalized

  dynamic i;
  i = 100;
  print("$i");
  i = true;
  print("$i");
  i = "Hello";
  print("$i");

}
