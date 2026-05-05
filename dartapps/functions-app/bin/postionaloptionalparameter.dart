void sendMail(
  String? from,
  String? to,
  String? msg, [
  String? device = "Mobile",
]) {
  print("From $from");
  print("To $to");
  print("Message $msg");
  print("Device $device");
}
void main(){
  sendMail("admin@cts.com", "subu@cts.com", "You got a mail");
  sendMail("admin@cts.com", "subu@cts.com", "You got a mail","Lap top");

}
