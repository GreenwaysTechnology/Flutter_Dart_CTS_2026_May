class Animal {
  void eat() {
    print("Animal eats");
  }
}

class Dog extends Animal {
  @override
  void eat() {
    super.eat();
    print("Dog eats");
  }

  void bark() {
    print("Dog barks");
  }
}

void main() {
  //program to sub type
  // Dog dog = Dog();
  // dog.eat();
  // dog.bark();
  Animal dog = Dog();
  dog.eat();
  //dog.bark();
  //Type casting : From animal to Dog
  Dog tmpDog = dog as Dog;
  tmpDog.bark();
}
