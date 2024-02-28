// TODO : Relate the abstract class with abstraction

abstract class Student {
  void reading();
  void joiningClass();

  void playing() {
    print('Playing Call of Duty');
  }
}

abstract class ABC {}

class CSEStudent extends Student {

  @override
  void reading() {
    print('Reading some code');
  }

  @override
  void joiningClass() {
    print('Via google meet');
  }
}

class PharmacyStudent extends Student {
  @override
  void reading() {
    print('Reading chemistry');
  }

  @override
  void joiningClass() {
    print('In university');
  }

  @override
  void playing() {
    print('Football');
  }
}

class LawStudent implements Student, ABC {

  @override
  void joiningClass() {
    // TODO: implement joiningClass
  }

  @override
  void reading() {
    // TODO: implement reading
  }

  @override
  void playing() {
    // TODO: implement playing
  }

}

void main() {
  CSEStudent student = CSEStudent();
  student.reading();

  PharmacyStudent pharmacyStudent = PharmacyStudent();
  pharmacyStudent.reading();
}