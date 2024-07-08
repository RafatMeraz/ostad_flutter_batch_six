import 'package:get/get.dart';

// Reactive approach
/*class CounterController {
  RxInt _count = 0.obs;

  RxInt get count => _count;

  void incrementCount() {
    _count += 2;
  }

  void decrementCount() {
    _count -= 3;
  }
}*/

class CounterController extends GetxController {
  int _count = 0;

  int get count => _count;

  void incrementCount() {
    _count += 2;
    update();
  }

  void decrementCount() {
    _count -= 3;
    update();
  }
}
