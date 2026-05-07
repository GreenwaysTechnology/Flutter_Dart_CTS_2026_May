class Animal {
  void eat() {
    print("Animal eats");
  }
}

class Dog extends Animal {
  void bark() {
    print("Dog barks");
  }
}

void main() {
  Dog dog = Dog();
  dog.eat();
  dog.bark();
}
