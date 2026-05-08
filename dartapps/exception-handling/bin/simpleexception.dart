void main() {
  try {
    int result = 12 ~/ 0;
    print(result);
  } catch (e) {
    print(e);
  }
}
