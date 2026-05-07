class Area {
  final int length;
  final int breadth;
  final int area;

  //private constructor
  //syntax :1
  const Area._internal({this.length = 0, this.breadth = 0, this.area = 0});

  //syntax :2
  // const Area._internal({this.length = 0, this.breadth = 0})
  //   : area = length * breadth;

  //factory constructor
  factory Area({int length = 0, int breadth = 0}) {
    //invoke private constructor
    return Area._internal(
      length: length,
      breadth: breadth,
      area: length * breadth,
    );
  }
}

void main() {
  Area area = Area(length: 10, breadth: 20);
  print("length ${area.length} breadth ${area.breadth} area ${area.area} ");
}
