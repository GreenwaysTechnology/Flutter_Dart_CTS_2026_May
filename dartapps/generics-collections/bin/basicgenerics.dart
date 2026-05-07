class IntData {
  int? data;

  IntData(this.data);
}
class DoubleData {
  double? data;

  DoubleData(this.data);
}

void main(){
  IntData intData = IntData(10);
  DoubleData doubleData = DoubleData(10.5);

  print(intData.data);

}
