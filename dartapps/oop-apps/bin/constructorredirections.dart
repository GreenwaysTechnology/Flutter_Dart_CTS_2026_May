
class Point {
  double x, y;
  Point(this.x, this.y);
  Point.createPoint(double x,double y): this(x,y);
}

void main(){
  Point point = Point.createPoint(10, 20);
  print(point.x);
  print(point.y);

}