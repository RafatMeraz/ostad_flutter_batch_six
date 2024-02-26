import 'person.dart';

void main() {
  Person randomPerson = Person('Habib', 'Rahman', 'Male', 30);
  print(randomPerson.getFullName());

  randomPerson.changeGender('Female');

  print(randomPerson.getGender());

  print(randomPerson.getFullName());

  randomPerson.setAge = 34;

  print(randomPerson.getAge);
}