class Message {
  static String warning = "Warning";
  static String error = "Error";
  static String info = "Info";

  static void show(String message) {
    print(message);
  }
}

void main() {
  print(Message.warning);
  print(Message.error);
  print(Message.info);
  Message.show("Subramanian");
}
