void main() {
  String str = "Hello";
  var name = "Subramanian Murugan";
  print("Message " + str);
  print("Name" + name);
  //interpolation syntax - ${variable}
  print("Message ${str}");
  print("Name ${name}");
  //interplation syntax - $variable
  print("Message $str");
  print("Name $name");

  var html ="""
      <html>
      <head>
      <title>Dart</title>
      </head>
      <body>
      <h1>Dart</h1>
      </body>
      </html>
  """;
  print(html);
}
