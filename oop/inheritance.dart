// parent/super/base
class Human {
  int hands;
  int legs;
  int eyes;

  Human(this.hands, this.legs, this.eyes);

  void moving() {
    print('Moving');
  }

  void eating() {
    print('Eating');
  }

  void talking() {
    print('Talking');
  }
}

// Child
class Student extends Human {
  String institute;
  String section;

  Student(int hands, int eyes, int legs, this.institute, this.section)
      : super(hands, legs, eyes);

  @override
  void talking() {
    print('Talking politely');
  }

  @override
  void eating() {
    super.eating();
    print('Dancing while eating');
  }
}

class Teacher extends Human {
  String institute;
  String subject;

  Teacher(super.hands, super.legs, super.eyes, this.institute, this.subject);

  @override
  void moving() {
    print('Moving with notes');
  }
}

void main() {
  Student studentOne = Student(2, 2, 2, 'DU', 'A');
  studentOne.moving();
  studentOne.eating();
  studentOne.talking();
  print(studentOne.legs);

  Teacher englishTeacher = Teacher(2, 2, 2, 'BUET', 'English');
  englishTeacher.moving();
}













