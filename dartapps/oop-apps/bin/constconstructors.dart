
class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);
}

void main(){
  Point point = Point(1, 3);
  print(point.x);
  print(point.y);
  //point.x=10;
  Point point1 = point;
  //point1.x=10;

}