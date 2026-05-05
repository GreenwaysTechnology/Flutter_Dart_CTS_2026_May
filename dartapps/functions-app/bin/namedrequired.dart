void httpClient({
  required String? url,
  String? method = "GET",
  int? timeout = 5000,
  String? headers,
}) {
  print("url $url");
  print("method $method");
  print("timeout $timeout");
}

void main() {
  httpClient(url: "http://www.google.com");
  httpClient(url: "http://www.google.com", method: "POST");
  httpClient(url: "http://www.google.com", timeout: 10000);
  httpClient(url: "http://www.google.com", method: "POST", timeout: 10000);
  // httpClient(); if you dont pass url you will get compile time error
}
