void main() {
  //? is nullable, the variable can be null,the variable can be assigned with null
  int? a = null;
  print(a.toString());

  //here ? is default, b can be nullable
  var b = null;
  print(b.toString());

  //variable without any value
  //int d; //here the value of d is null
  //print(d.toString()); //compile time error
  int? d;
  print(d.toString());
  d = 10;
  print(d.toString());

  var c ;
  print(c.toString());
  c = 1000;
  print(c.toString());

  ///property access
  String? name = "subramanian";
  print(name.toUpperCase());
  name=null;
  //solution 1:
  if(name!=null){
    print(name.toUpperCase());
  }
  //solution 2: print null
  print(name?.toUpperCase());

  //solution 3: what if i want Exception, not null string value
  print("Name2 ${name!.toUpperCase()}"); // if name is null Exception is thrown at runtime


}
