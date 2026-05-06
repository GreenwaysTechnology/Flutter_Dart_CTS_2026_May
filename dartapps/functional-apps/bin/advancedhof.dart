// void exec(int no, Function callback) {
//   callback(no);
// }

void exec(int? no, Function? callback) {
  //callback(no);
  if (callback != null) {
    callback(no);
  }
}

void asyncFunc({String? name = "Subramanian", Function? f}) {
  if (f != null) {
    f(name);
  }
  // f!(name); //f?.(name) //throw null exception
  f?.call(name); //safe call
}

void doubleIt(int i) => print(i * i);

void login({
  String? userName = "",
  String? password = "",
  Function? resolve,
  Function? reject,
}) {
  if (userName == "admin" && password == "admin") {
    resolve?.call();
  } else {
    reject?.call();
  }
}

void main() {
  exec(2, doubleIt);
  asyncFunc(
    name: "Subramanian",
    f: (name) {
      print(name);
    },
  );

  asyncFunc(name: "Subramanian", f: (name) => print(name));
  asyncFunc(name: "Subramanian", f: null);
  login(
    userName: "admin",
    password: "admin",
    resolve: () => print("Success"),
    reject: () => print("Failure"),
  );
}
