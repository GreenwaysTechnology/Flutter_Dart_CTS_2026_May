void main() {
  try {
    int result = 12 ~/ 0;
    print(result);
  } on UnsupportedError {
    print("Exception caught");
  } catch (e, s) {
    print(e);
  }
}
