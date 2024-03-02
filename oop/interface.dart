import 'human.dart';

class Sakil extends Human {
  // interface
  @override
  void eating() {
    _movingTheHands();
  }

  // implementation
  void _movingTheHands() {
    print('Moving');
  }

  @override
  void moving() {
    // TODO: implement moving
  }

  @override
  void dummy() {
    // TODO: implement dummy
  }
}

class Hasan implements Human {
  @override
  void eating() {
    // TODO: implement eating
  }

  @override
  void moving() {
    // TODO: implement moving
  }

  @override
  void talking() {

  }

  @override
  void dummy() {
    // TODO: implement dummy
  }
}

abstract class Jakir implements Human {}
