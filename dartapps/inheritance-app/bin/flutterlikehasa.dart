abstract class Widget {
  void render();
}

class TextWidget extends Widget {
  final String? text;

  TextWidget({this.text});

  @override
  void render() {
    print("Text:$text");
  }
}

class ContainerWidget extends Widget {
  //has-a
  final Widget child;
  final String color;
  final int padding;

  ContainerWidget({
    required this.child,
    required this.color,
    required this.padding,
  });

  @override
  void render() {
    print("Container Start");
    print("Color: $color");
    print("Padding: $padding");
    //composition
    child.render();
    print("Container End");
  }
}

class CenterWidget extends Widget {
  final Widget child;

  CenterWidget({required this.child});

  @override
  void render() {
    print("Center Widget Start");
    child.render();
    print("Center Widget End");
  }
}

class AppBarWidget extends Widget {
  final Widget title;

  AppBarWidget({required this.title});

  @override
  void render() {
    print("AppBar Widget Start");
    title.render();
    print("AppBar Widget End");
  }
}

class ScaffoldWidget extends Widget {
  final Widget appBar;
  final Widget body;

  ScaffoldWidget({required this.appBar, required this.body});

  @override
  void render() {
    print("Scaffold Widget Start");
    appBar.render();
    body.render();
    print("Scaffold Widget End");
  }
}

class MaterialWidget extends Widget {
  final Widget home;

  MaterialWidget({required this.home});

  @override
  void render() {
    print("Material Widget Start");
    home.render();
    print("Material Widget End");
  }
}

void main() {
  Widget app = MaterialWidget(
    home: ScaffoldWidget(
      appBar: AppBarWidget(title: TextWidget(text: "My App")),
      body: CenterWidget(
        child: ContainerWidget(
          child: TextWidget(text: "Hello Flutter"),
          color: "color",
          padding: 12,
        ),
      ),
    ),
  );
  app.render();
}
