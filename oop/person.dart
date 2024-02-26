class Person {
  String _firstName;
  String _lastName;
  String _gender;
  int _age;

  Person(this._firstName, this._lastName, this._gender, this._age) {
    print(_getBirthYear());
  }

  // getter
  String getFullName() {
    return _firstName + ' ' + _lastName; // String concat
  }

  // setter method
  void changeGender(String gender) {
    if (gender == 'Male' || gender == 'Female') {
      _gender = gender;
    }
  }

  void set setAge(int newAge) {
    if (newAge >= 12 && newAge <= 100) {
      _age = newAge;
    }
  }

  int get getAge {
    return _age;
  }

  // getter
  String getGender() {
    return _gender;
  }

  int _getBirthYear() {
    return 2024 - _age;
  }
}