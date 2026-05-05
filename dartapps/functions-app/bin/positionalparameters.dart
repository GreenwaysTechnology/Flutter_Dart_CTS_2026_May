void sendMail(String from, String to, String subject, String body) {
  print("From $from");
  print("To $to");
  print("Subject $subject");
  print("Body $body");
}

void main() {
  sendMail(
    "admin@cts.com",
    "subu@cts.com",
    "Update your system",
    "Please update all security updates",
  );
}
