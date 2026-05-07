abstract class Animal {
  void eat();

  void canWalk();

  void canRun();
}

class Dog implements Animal {
  @override
  void eat() {
    print("Dog eats");
  }

  @override
  void canWalk() {
    print("Dog can walk");
  }

  @override
  void canRun() {
    print("Dog can run");
  }
}

void main() {
  Animal dog = Dog();
  dog.eat();
  dog.canWalk();
  dog.canRun();
}
