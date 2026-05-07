
class Adder {
  T add<T,E>(T value1){
    return value1;
  }
}
void main(){
  Adder adder = Adder();
  var res = adder.add<int,int>(10);
  print("res ${res}");
}