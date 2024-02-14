main() {
  // key : value
  Map<int, String> studentList = {
    1 : 'Joti',
    2 : 'Jawad',
    3 : 'Rashedul',
    5 : 'Sami'
  };
  print(studentList[5]);
  print(studentList);
  studentList[50] = 'Rafat';
  studentList.addAll({
    24 : 'Sunny',
    34 : 'Rafi'
  });
  studentList[1] = 'UK';
  studentList.addAll({
    34 : 'Hasan'
  });
  print(studentList);
  print(studentList.keys);
  print(studentList.values);
  print(studentList.length);
  print(studentList[60]);

  Map<String, Map<String, int>> dummy = {
    'name' : {
      'anotherName' : 1234
    },
  };
  print(dummy);
  print(studentList.containsKey(46));
  print(studentList.containsValue('Rafat'));
  print(dummy['name']['anotherName']);
}