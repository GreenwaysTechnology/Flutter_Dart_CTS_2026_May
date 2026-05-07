class Animal {
  void eat() {
    print("Animal eats");
  }

}

class Dog implements Animal {
  @override
  void eat() {
    print("Dog eats");
  }
}

void main() {
  Animal dog = Dog();
  dog.eat();
}
