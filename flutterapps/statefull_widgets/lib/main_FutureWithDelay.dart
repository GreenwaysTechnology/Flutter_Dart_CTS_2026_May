Future<String> getUserName() {
  return Future.delayed(Duration(seconds:10), () => "Subramnaian");
}
void main(){
  print("start");
  getUserName().then((value) => print(value));
  print("end");

}