void main() {
  final j = 10;
  final int k = 10;
  //print("j $j");
   //j=13; compile time error final variable can be set only once

  var i = 10;
  print("i $i");
  //reinitialize the variable
  i = 90;
  print("i $i");

  //fianl
  final int jk = 10;
  print("jk $j");

  const int d = 10;
  print("d $d");

}
