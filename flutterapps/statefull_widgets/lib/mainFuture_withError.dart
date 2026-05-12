Future<String> getError() {
  return Future.error("somthing went wrong!");
}

void main(){
  print("start");
  getError().then((value) => print(value));
  print("going on");
  print("end");
}
