// Exception handling
// Try - catch
// Throws

// try, catch, throw

void main() {
  printer();
}

void printer() {
  try {
    printHeadline();
  } on CustomException {
    print('custom');
  } on MachineException {
    print('Machine');
  } catch (e) {
    print('Something went wrong : ${e.toString()}');
  } finally {
    print('Code from finally');
  }
  printContent();
}

void printHeadline() {
  // throw CustomException();
  // throw MyException();
  // throw MachineException();
  // throw Exception('not printing');
  print('Printing headline');
}

void printContent() {
  print('Printing main content');
}

// class MyException extends Exception {
//
// }

class CustomException implements Exception {
  @override
  String toString() {
    return 'This is our custom exception class';
  }
}

class MachineException implements Exception {

  @override
  String toString() {
    return 'This is our printer exception';
  }
}
