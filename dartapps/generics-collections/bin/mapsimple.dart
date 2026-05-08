void main() {
  Map<String, String> countriesAndCapitals = {
    "India": "New Delhi",
    "USA": "Washington DC",
    "UK": "London",
    "Germany": "Berlin",
    "France": "Paris",
    "Japan": "Tokyo",
    "China": "Beijing",
    "Russia": "Moscow",
    "Australia": "Canberra",
    "Brazil": "Brasilia",
    "Canada": "Ottawa",
    "Egypt": "Cairo",
  };
  countriesAndCapitals.forEach((key, value) {
    print("$key = $value");
  });
}
