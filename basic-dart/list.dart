main() {
  List<String> studentList = ['Rahim', 'Karim', 'Rohan', 'Raihan'];
  print(studentList);
  print(studentList.length);
  studentList.add('Shamim');
  studentList.add('Sabiha');
  print(studentList);
  studentList = ['asfs'];
  print(studentList);
  studentList.addAll(['Tanmoy', 'Shakil', 'Rahim', 'Rahim']);
  print(studentList);
  print(studentList[0]);
  print(studentList[1]);
  studentList.remove('Tanmoy');
  studentList.insert(2, 'New');
  print(studentList);
  studentList.removeAt(2);
  // studentList.removeWhere((item) => item == 'Rahim');
  print(studentList);
  // print(studentList.elementAt(3));
  print(studentList.first);
  print(studentList.last);
  studentList.sort();
  print(studentList);
}