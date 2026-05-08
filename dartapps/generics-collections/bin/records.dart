class Location {
  int? lat;
  int? lng;

  Location(this.lat, this.lng);

  @override
  String toString() {
    // TODO: implement toString
    return "Location{lat: $lat, lng: $lng}";
  }
}

Location getLocation() {
  int lat = 10;
  int lng = 20;
  return Location(lat, lng);
}

(int, int) getMapLocation() {
  return (10, 20);
}

void main() {
  Location location = getLocation();
  print(location);
  var myLocation = getMapLocation();
  print(myLocation.$1);
  print(myLocation.$2);
}
