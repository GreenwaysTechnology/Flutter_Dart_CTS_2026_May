void add(int a, int b) {
  print("a $a b$b");
}

void callback(Function cb) {
  cb();
}

void connect(Function cb) {
  var status = cb("Connected");
  print(status);
}

void main() {
  var i = 10;
  var j = 20;
  add(i, j);
  //direct value
  add(10, 20);

  //pass function  as parameter
  Function myFun = () {
    print("My Function");
  };
  callback(myFun);
  var myFunArrow = () => print("My Arrow Function");
  callback(myFunArrow);

  //syntax 2:
  callback(() {
    print("My Inline  Function");
  });
  callback(() => print("My Inline Arrow Function"));

  //parameters and callbacks
  connect((var msg) {
    print(msg);
    return "done"!;
  });
}
