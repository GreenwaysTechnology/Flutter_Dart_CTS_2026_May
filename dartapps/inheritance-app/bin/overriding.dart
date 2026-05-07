class Animal {
  void eat() {
    print("Animal eats");
  }
}

class Dog extends Animal {
  @override
  void eat() {
    print("Dog eats");
  }

  void bark() {
    print("Dog barks");
  }
}

void main() {
  Dog dog = Dog();
  dog.eat();
  dog.bark();
}
