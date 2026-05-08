import "package:http/http.dart" as http;

void fetchData() async {
  var response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/posts"),
  );
  print(response.body);
}

void main() {
  fetchData();
}
