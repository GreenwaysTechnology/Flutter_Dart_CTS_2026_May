class DepositException implements Exception {
  @override
  String toString() {
    // TODO: implement toString
    return "Amount cannot be negative";
  }
}

void deposit(int amount) {
  if (amount <= 0) {
    throw DepositException();
  }
}

void main() {
  try {
    deposit(-500);
  } catch (e) {
    print(e);
  }
}
