class Point {
  final int x;
  final int y;

  //constant constructors
  const Point(this.x, this.y);
}

void main() {
  //without immutablity
  Point p1 = Point(1, 3);
  Point p2 = Point(1, 3);
  print("Hashcode of p1 ${p1.hashCode}");
  print("Hashcode of p2 ${p2.hashCode}");

  //Mutable syntax
  Point p3 = const Point(1, 3);
  Point p4 = const Point(1, 3);
  print("Hashcode of p3 ${p3.hashCode}");
  print("Hashcode of p4 ${p4.hashCode}");


}
