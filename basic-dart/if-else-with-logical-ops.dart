main() {
  int mark = 50;
  if (mark >= 80 && mark <= 100) {
    print('A+');
  } else if (mark >= 70 && mark < 80) {
    print('A');
  } else if (mark >= 65 && mark < 70) {
    print('A-');
  } else if (mark >= 60 && mark < 65) {
    print('B');
  } else if (mark >= 50 && mark < 60) {
    print('C');
  } else if (mark >= 40 && mark < 50) {
    print('D');
  } else if (mark >= 0 && mark < 40) {
    print('F');
  } else {
    print('Invalid mark');
  }

  if (mark == 100 || mark == 50) {
    print('This mark is divisible by 50');
  } else {
    print('Not Divisible');
  }
}