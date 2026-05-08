
class Person {
   String? name;
   String? city;

   @override
  String toString() {
    // TODO: implement toString
    return 'Person{name: $name, city: $city}';
  }
}
void main(){
  Person person = Person();
  person.name = "John";
  person.city ="New york";
  print(person.hashCode);
  print(person.toString());
}