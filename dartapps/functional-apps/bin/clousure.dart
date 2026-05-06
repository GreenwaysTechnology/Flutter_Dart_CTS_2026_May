Function makeAdder(int addBy) {
  //closure: if inner function access outter function variables either args or local variable, it becomes
  return (int i) {
    return addBy + i;
  };
}

void main() {
 var counter = makeAdder(10);
 print(counter(1));
 print(counter(10));
 print(counter(13));
 print(counter(15));
 print(counter(16));
 print(counter(17));

}
