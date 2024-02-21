void main() {
  // Function call
  welcomeMessage(name: 'Rafat', age: 34, address: 'sdf');
  welcomeMessage(name: 'Rahim', address: 'Mirpur 13');
  welcomeMessage(name: 'Rahim', address: 'sfsdf', age: 26);
  welcomeMessage(name: 'Rahim', address: 'sfsdf', age: 26);
  welcomeMessage(name: 'Rahim', address: 'sfsdf', age: 26);
  welcomeMessage(name: 'Rahim', address: 'sfsdf', age: 26);
  welcomeMessage(name: 'sdfsdfdf');
  welcomeMessage(name: 'sfdsdfasfsdf asdf asdf sd');
  welcomeMessage(name: 'Karim', address: 'BRTA nearby');
  double r = add(12, 10);
  print(r);
}

// return-type function-name(params) {
// body
// }

// function
// Parameters
// [] - Optional operator
// welcomeMessage(String name, [String address = '', int age = '']) {
// named optional params
void welcomeMessage({required String name, String address = '', int age = 0}) {
  // Body
  print('Morning, $name');
  print('How are you? $address');
  print('Age : $age');
}

// return type
double add(int a, double b) {
  double result = a + b;
  print(result);
  return result;
}