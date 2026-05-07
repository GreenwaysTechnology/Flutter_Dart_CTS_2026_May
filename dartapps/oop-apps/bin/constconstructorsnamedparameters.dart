class Point {
  final int x;
  final int y;

  //constant constructors
  const Point({this.x = 0, this.y = 0});
}

void main() {
  //without immutablity
  Point p1 = Point(x: 1, y: 3);
  Point p2 = Point(x: 1, y: 3);
  print("Hashcode of p1 ${p1.hashCode}");
  print("Hashcode of p2 ${p2.hashCode}");

  //Mutable syntax
  Point p3 = const Point(x: 1, y: 3);
  Point p4 = const Point(x: 1, y: 3);
  print("Hashcode of p3 ${p3.hashCode}");
  print("Hashcode of p4 ${p4.hashCode}");

  Point p5 = const Point();
  Point p6 = const Point();
  print("Hashcode of p5 ${p5.hashCode}");
  print("Hashcode of p6 ${p6.hashCode}");
}
