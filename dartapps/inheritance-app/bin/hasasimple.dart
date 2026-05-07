class Engine {
  String? type;
  int? power;

  Engine({this.type = "petrol", this.power = 200});

  void start() {
    print("Engine started");
  }

  void stop() {
    print("Engine stopped");
  }
}

class Car {
  final Engine? engine;

  Car({this.engine});

  void start() {
    engine?.start();
  }

  void stop() {
    engine?.stop();
  }
}

void main() {
  // Engine engine = Engine();
  // Car car = Car(engine: engine);
  Car car = Car(engine: Engine(
    type: "petrol",
    power: 200,
  ));
  car.start();
  car.stop();
}
