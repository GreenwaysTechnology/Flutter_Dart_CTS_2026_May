//parent class
class Person {
  String? name;
  int? age;

  Person(this.name, this.age);
}

//child class
class Student extends Person {
  //Child Property
  String? schoolName;

  Student(String name, int age, this.schoolName) : super(name, age);
}

void main() {
  Student student = Student("Subramanian Murugan", 45, "SSVM WORLD School");
  print("Name ${student.name}");
  print("Age ${student.age}");
  print("School Name ${student.schoolName}");
}
