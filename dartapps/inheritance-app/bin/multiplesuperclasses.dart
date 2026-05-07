
abstract class Animal {
  void eat();
}

abstract class Walking {
  void canWalk();
}

abstract class Running {
  void canRun();
}

class Dog implements Animal, Walking, Running {
  @override
  void eat() {
    print("Dog eat");
  }

  @override
  void canRun() {
    print("Dog can run");
  }

  @override
  void canWalk() {
    // TODO: implement canWalk
    print("Dog can walk");
  }
}

void main() {
  var dog = Dog();
  dog.eat();
  dog.canWalk();
  dog.canRun();
}
